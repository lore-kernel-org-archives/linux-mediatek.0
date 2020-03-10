Return-Path: <SRS0=h1kY=43=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27899C10F27
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 13:46:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C62020637
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 13:46:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y9+KBUbH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="abZroker"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C62020637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HmjXg5Mz6hBqrEiMnyCwcFiW4+bNPPNXf9rwMalyjKY=; b=Y9+KBUbHy6L7wt
	X7BPqhkHAjaFliaHw4CxE8tsqV9XZUBpda4BvZ/q97yWPDCPInzDHVU4Ui/DKX5vMqSwrNu76pU7f
	I/jXS5GJAzAXR2oG4zGJ0sfII3t/TygdwM9seE6hVYCO5gbF7Slsr+PM30SR+bWqVazU4IRcwjJJS
	qpmzNCkbNt2wI2QxDKaSxvmzVCq84x6n4Xh+RlHPenGl1yk9oj8M0ku2YWlWWwJh/q7YMdpspbfmZ
	JvjU4U4L8w3TQ+Qbu89X0nqvdGc+JFmvc1QrPYjVx1pq58wU++Y+qx8ztE1MG4gFnZLTR/VUp9p4H
	D4shTAGkH8VHNqY73nBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBfDH-0004R1-4D; Tue, 10 Mar 2020 13:46:27 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBfD0-00049O-CH
 for linux-mediatek@lists.infradead.org; Tue, 10 Mar 2020 13:46:11 +0000
Received: by mail-wm1-x334.google.com with SMTP id e26so1408436wme.5
 for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2020 06:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wD/rjwDaFSH4m0qLvYcsJe5uINdhvscpogJ3gh+ddBE=;
 b=abZrokerv1XQs4CdYgMZDC/O5UauiH6mqKC2Rrdy1tv4xSXq1RKsr+iLSyaMu5QRrY
 eNToWk64+vZzKd5eeIFecdjcgvg5U62vU7dexhWjTJGcM9vb+TmvA6P4A4xsOXQvW2fi
 wb2/v2YN1HJGBWhNsaZaJsTHq9C+BIA4ID0FoIbZUuGmip1war0RJ9oU2O6ca/Eb8bnp
 lKwQxo9FxcvxnukaM01tLAXT2mdTHQ+BWTwNmBjHEBFWXKM+WWrV9KQRZ9Gjn8GzG1NP
 UzG8pjbwxIVQlVYsWb8vQaUL2aaeAjFaIZ9pL5L7SBi0tKFDOAG5ttq+QXKgWrlHYdsw
 mQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wD/rjwDaFSH4m0qLvYcsJe5uINdhvscpogJ3gh+ddBE=;
 b=YZzs4U11zI6e0gnrB4YsNU1tE+P/RbDySD5xlhdpzHVaoRksOSadmdpBAGwafozV4h
 mJrNOaISayNko74KmBUkzhrSjqLDoU/m93abMWU1hQbLhfr4WSXpE2XDAvngGh39ZEbu
 D+r42ploOIeHih3KVqmJrxWmKXq8JrJtA+S5QXc4XcCoaK2uL4sNc/c8lsoBTZeMj8Lf
 RopDB7v4D42yl5/Jz8uv8HgdTPTjzQ3GLpyHKks5ZcjkM7FQNk9oEKaY2mpaPwtRACBP
 5JfrL7IwONkQk7Rwk3r95BQwdyGdKba/E1R/K6XgYrv8WnhvzKmqlMkO7yAV8QMFp0u8
 PcSA==
X-Gm-Message-State: ANhLgQ02Mt4GYDoNpfYnZCtpRuv3dcaljgSYAmI0HELmYcGNXMIW0UZd
 nYwbFRG2MusMQQLsxAiVmJmkZw==
X-Google-Smtp-Source: ADFU+vsAqODaD7c54dhNVCiGo6mkHHmbHDjZbcCM9Ns8rtR6QHeWU2SEQUgGGnzoUNA8SRhX+nS2rA==
X-Received: by 2002:a1c:f60d:: with SMTP id w13mr628899wmc.171.1583847967491; 
 Tue, 10 Mar 2020 06:46:07 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:e50c:c780:9a1:8b61])
 by smtp.gmail.com with ESMTPSA id d63sm4074009wmd.44.2020.03.10.06.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 06:46:06 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: ben.kao@intel.com, mchehab@kernel.org, robh+dt@kernel.org,
 mark.rutland@arm.com, matthias.bgg@gmail.com, davem@davemloft.net,
 gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com,
 andriy.shevchenko@linux.intel.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: [v1 0/3] media: ov8856: Add sensor modes & devicetree support
Date: Tue, 10 Mar 2020 14:46:00 +0100
Message-Id: <20200310134603.30260-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_064610_489631_1533DE5F 
X-CRM114-Status: UNSURE (   6.07  )
X-CRM114-Notice: Please train this message.
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
Cc: Robert Foss <robert.foss@linaro.org>, Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This adds devicetree support to the ov8856 driver.
In order to to aid debugging and enable future sensor
modes to be supported, module revision detection is also added.

Dongchun Zhu (1):
  media: dt-bindings: ov8856: Document YAML bindings

Robert Foss (2):
  media: ov8856: Add devicetree support
  media: ov8856: Implement sensor module revision identification

 .../devicetree/bindings/media/i2c/ov8856.yaml | 129 +++++++++++++++
 MAINTAINERS                                   |   1 +
 drivers/media/i2c/ov8856.c                    | 153 +++++++++++++++++-
 3 files changed, 281 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml

-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
