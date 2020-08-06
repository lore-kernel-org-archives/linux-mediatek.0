Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CC8C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:28:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2297422DFA
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:28:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z1Vztedh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dM1GCLp9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2297422DFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xlrK21c7NziaW2/uQ9+QOPSG/mJoiNXWeK919hPltfI=; b=z1Vztedhs35z3B5grxtGgl0FKI
	PkliHgRJFLA141Vbw1ImO8uwrLbsRWWYU5RX79I3jEKZZkyZmb118+dSjNMV0750X6C3b9nk1Tl8j
	4lS/9wsJ89G28Hw33ArKtm0sIq8p2HH+qx4ZJnRBeEGH+d0mSb2xt2Fc0v5Lv6TxpQhO91WNBsROt
	b034wRf0pisQLLSDboRMz4G3ybCAI01SyQj9pPbL/h8bhyKDYanquDTBYHCwBt7OT/7HkgQyWCSD9
	7fKEIvE3/BJvegzcJi4pk7gRV9bB/8XiHGD5cmhZgLj3o8AsOOWF7xHQqY31N+V6kZuaARyImXHQ8
	Y/NsS+hg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3cVv-0003ax-QX; Thu, 06 Aug 2020 09:48:43 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3cVt-0003aP-J7; Thu, 06 Aug 2020 09:48:42 +0000
Received: by mail-wr1-x443.google.com with SMTP id p20so8460464wrf.0;
 Thu, 06 Aug 2020 02:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=pQQbHRDXqKGonZmyfA/7H4FL5vlKcEV+QfkkDKraWtE=;
 b=dM1GCLp90nDRXLp2vBQkMHchQY/VB0Hl0yinYxzsStKhyeDUdDIRSOhlF8vCsf4yPr
 8192NiIdKfXofwr/WBi1KQTyQ+SJFKamXxfpj8yDxy5RzUWAuaPh/BKJO3PxeM+LO+/O
 b/zYTOKj2B5A8pWSFqWoh2s3kZkNnqfPJNxY8HKJhxWQW/GHP7IvF+yA8wyPSnNPOlfa
 enJgFTQdOx7wz/8vRiJWngQxGVbzv30hkrsy2bwErUSHueFpZoZ948cZriM6VhA3dmpv
 QvbAKqCTFOa/2R7MI4Xk6L+HDX0REwv3bxioVIDBcIVrBk7B8GE4rCctE9kiDQUyyjhf
 e4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=pQQbHRDXqKGonZmyfA/7H4FL5vlKcEV+QfkkDKraWtE=;
 b=m+L5wB08f/wKvDyHDKQwO9adpepkUNJBB9v5aHO/c1R3wcxhabZBDETDZxIADWy4Df
 GyACsLlPOeehQeS4oQZaK7SsGQJPY/TnwBto63/sVgCBNNfxkUzTYDjXWtW1TVPOMVcz
 hhwGdGAmz1Q02DQojRXPMFQ5d7SszkL6r7NyG7uHj2EyQ/o6bLCIZuRXXw1Kn37+PYoT
 BZdxKSw/8ZyPOt+vwMtEPuS4PcM8mNs5kv1/gK0MebroQse0wTgEvPpFnXM8z7NcptTH
 AuBTJkeUTnYgTaL2SmOQ0cDBt131dhPSB047SttKz1F91oKSREbOiu4xeyoec70hrfcX
 xlNw==
X-Gm-Message-State: AOAM531fOQjIH3EQkoo72++hs1q8SHH9I0iXGRRUJmXajg/uswwc3+6+
 ahfUr0wRW5cu2QWvlfAKIqs=
X-Google-Smtp-Source: ABdhPJy+IhnQM7YA6Ai0q9y4WNhairm37cfGCaJNnuPGVOSZRyFre9wihzJzR2mBEro2zDDT753Wbg==
X-Received: by 2002:adf:9e90:: with SMTP id a16mr7034449wrf.40.1596707319687; 
 Thu, 06 Aug 2020 02:48:39 -0700 (PDT)
Received: from ziggy.stardust ([213.195.117.232])
 by smtp.gmail.com with ESMTPSA id v12sm5795282wrs.2.2020.08.06.02.48.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 02:48:38 -0700 (PDT)
To: qii.wang@mediatek.com, wsa@the-dreams.de, yingjoe.chen@mediatek.com
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] i2c: mediatek: Fix i2c_spec_values description
Message-ID: <c410f784-7b51-0d65-7a41-3845214dd273@gmail.com>
Date: Thu, 6 Aug 2020 11:48:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_054841_754112_41253DAC 
X-CRM114-Status: GOOD (  13.60  )
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
Cc: Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The struct i2c_spec_values have it's members documented but is missing the 
starting '@', which leads to warings like:

drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member 
'min_low_ns' not described in 'i2c_spec_values'

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
  drivers/i2c/busses/i2c-mt65xx.c | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index e889f74703e4..f51b35fc400f 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -253,10 +253,10 @@ struct mtk_i2c {

  /**
   * struct i2c_spec_values:
- * min_low_ns: min LOW period of the SCL clock
- * min_su_sta_ns: min set-up time for a repeated START condition
- * max_hd_dat_ns: max data hold time
- * min_su_dat_ns: min data set-up time
+ * @min_low_ns: min LOW period of the SCL clock
+ * @min_su_sta_ns: min set-up time for a repeated START condition
+ * @max_hd_dat_ns: max data hold time
+ * @min_su_dat_ns: min data set-up time
   */
  struct i2c_spec_values {
  	unsigned int min_low_ns;
-- 
2.27.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
