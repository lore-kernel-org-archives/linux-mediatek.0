Return-Path: <SRS0=O6hk=3K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A2FC2D0CE
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 13:47:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B6642070C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 13:47:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lgoEKbi0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWqXTSOR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B6642070C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wwpXS5UjrTckaDmL2ZsEHzNz0zjNm5hh32fo8POyKWs=; b=lgoEKbi06uU6Hf
	aQSWG1gMp0R0grCK+RNshnOilHwRmWSLsII3n37mLqjO91vGobfMAHyc/6laTshvqBAJzd5ltD7KR
	iN2s9QMXMQybSt4YD87aVJ1vQjmxxtTy87AGrgAyIVHBR+MNp7MVCcjiRCsnXlpQBBVYgt7TER8Gj
	pHWe7l31FFSO7U80C7KgKPko7St9XLSDvJMiKu8s0MrUJy5/M/6OEfD4WBqrDvbf4eDYJ2HfgYipH
	dIagGOF3AVye0gGNBur/8DW+bD/dgatsuOhMsezzhu7hvgBegd2VtMZz4xE/oKsJsfzyu5o5Bi3bk
	t9HHdO+Ev3zr06KI0GTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itts9-0001o0-QW; Tue, 21 Jan 2020 13:47:13 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itts4-0001n1-8w; Tue, 21 Jan 2020 13:47:12 +0000
Received: by mail-wr1-x441.google.com with SMTP id y11so3256112wrt.6;
 Tue, 21 Jan 2020 05:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=GlVSvFefthhvDndxHquihB1g9N3pysqIKkyZHPQ+LOQ=;
 b=gWqXTSOR7c3TA7dwjaF4xYiCZIGscmbPPMzPaK//HkoFkOPNoFymt3z3u6KM3fEdJo
 YdpnAcVFZ2kRZHa3fL5p8xP9qWPKL4baQ6IbaO03oLZxR+yb0uQEQY21sWxcUupxqrWG
 OSLv6wjpHspDdc6KPDJtJ57aDFgM088BwF6iY0b7XYd/e2m1jikcBKO6sMpTafb0s33D
 HkaSpCRuNxe84bWRJ3Gd3AT/ZgGU/BQ/YCMGczMY8g9FymMb9JfrIRVa831npeV1d5Gv
 Uds0sYJ9LXBRLiha54LT8le77VzIwPA20s1Xw/Xx+4YBG/4QP1b9x6amWyftIdn7F06l
 lBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=GlVSvFefthhvDndxHquihB1g9N3pysqIKkyZHPQ+LOQ=;
 b=t8ch+lh+rKvrpSOjqkx3FLQE3AnkAs0ep0z0FsnFYYwDQ8OqEEmSrV4qvwox+sc79u
 8oC7s/elU8JI9vC+D9eWXJXBgmReEy0x9E3Aa1gsxkWY9HyuTb5j2twNKBpni1TqPcPu
 4e6dKF4fZz+Oh+w+8geI2/VhOKy7JUSz97MGHBZJwtXNwarX5oK9ai+dQvSLjd9Qyxk6
 EHIK1mc2p2OCv4nhAYKMW6zoyMH5uo7T1BkBhZDSxYqpl7RaC06BTrt/vsNBpnUe75mj
 n+vhDsraaoUS/WHMF6mVYsUAlgcv+oVwlV/EnKPkm5C6ZelGpxiIF7sL7e4tfIjxt6Qn
 O2zA==
X-Gm-Message-State: APjAAAW7MDj6bE58w3i+F9D6UjRAyg4xtOBR2zidijzESmx8pQ1dVXq4
 LLaSmHtA5UbvU1U7An87qpI=
X-Google-Smtp-Source: APXvYqw9ozq/43cGjkx6h7pBZMO6XPg/SApSBU9iRuCkRi8YdUpV7oxeAri8PTODt89gXFbTc2u3Bg==
X-Received: by 2002:adf:c54e:: with SMTP id s14mr5150884wrf.385.1579614426236; 
 Tue, 21 Jan 2020 05:47:06 -0800 (PST)
Received: from linux ([62.96.18.94])
 by smtp.gmail.com with ESMTPSA id u8sm3870475wmm.15.2020.01.21.05.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 05:47:05 -0800 (PST)
Date: Tue, 21 Jan 2020 14:47:05 +0100
From: Sandesh Kenjana Ashok <sandeshkenjanaashok@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] staging: mt7621-pinctrl: Align to fix warnings of line over
 80 characters
Message-ID: <20200121134705.GA28240@SandeshPC>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_054708_317155_4140C2D1 
X-CRM114-Status: GOOD (  10.40  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devel@driverdev.osuosl.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Issue found by checkpatch.

Signed-off-by: Sandesh Kenjana Ashok <sandeshkenjanaashok@gmail.com>
---
 drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c b/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
index d0f06790d38f..df5da5fce630 100644
--- a/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
+++ b/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
@@ -159,7 +159,8 @@ static int rt2880_pmx_group_enable(struct pinctrl_dev *pctrldev,
 }
 
 static int rt2880_pmx_group_gpio_request_enable(struct pinctrl_dev *pctrldev,
-						struct pinctrl_gpio_range *range,
+						struct pinctrl_gpio_range
+						*range,
 						unsigned int pin)
 {
 	struct rt2880_priv *p = pinctrl_dev_get_drvdata(pctrldev);
@@ -218,10 +219,10 @@ static int rt2880_pinmux_index(struct rt2880_priv *p)
 	p->func_count++;
 
 	/* allocate our function and group mapping index buffers */
-	f = p->func = devm_kcalloc(p->dev,
-				   p->func_count,
-				   sizeof(struct rt2880_pmx_func),
-				   GFP_KERNEL);
+	f = p->func;
+	p->func =  devm_kcalloc(p->dev, p->func_count,
+				sizeof(struct rt2880_pmx_func), GFP_KERNEL);
+
 	gpio_func.groups = devm_kcalloc(p->dev, p->group_count, sizeof(int),
 					GFP_KERNEL);
 	if (!f || !gpio_func.groups)
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
