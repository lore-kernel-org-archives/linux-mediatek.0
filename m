Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3DDE7717F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2024 07:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HT5Vw1c5JsjdkFWM9Rgu+pVa9jSJRpnur3CjtgBsZuo=; b=4l940Zn6qAVyA7
	B/cVQ7Nw62s5+avxseSPv5Cwgc83RP5EbXK4hR2Ehd5hfgOXA1MLiF015voCJILztI1tXZPlQ1es1
	ala9mjLnCxQ5brNzrMZc8yOxIbAvkS+ZxHWrp/2+WFMxT57AcQp3PNRKDgXM+DK27l7MuehLenHp+
	hbfXJ7h1LTt5jSjQz+1T7MlnLkNup0hUqZeag6I5K8LP4tFHU4QCDH9uk3eFVYnMyYS3gqKNnFBuo
	2R4IWQfQLOutUIOoXzgiZ88koK+5SdKwHu3OpwIHeM5dVCQwNfmp8Qqiuojn7I0K8JzLZdcZYfsAY
	cMCBCEcQi8/BZxGBVPKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKujF-0000000AZ2g-1iTo;
	Tue, 10 Dec 2024 07:32:21 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKujD-0000000AZ20-04AV
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Dec 2024 07:32:20 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-216426b0865so17889935ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Dec 2024 23:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733815938; x=1734420738; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HT5Vw1c5JsjdkFWM9Rgu+pVa9jSJRpnur3CjtgBsZuo=;
        b=QLc6cvVxNNm0HQyWqzH6YII3B+3IKdQklE+LSYU+r/0RkBFI0k6ku5C2A5pph83MMo
         q2g95iAP0NPQyHCHd18soYXuk9bn2ScQjRwkKmfgkTUJ7IFyuFgk5YsBTFZ1KzS4ye9G
         XAc6w7psqW2kYPZ3djXXo+NF8XJnQt+geyx7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733815938; x=1734420738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HT5Vw1c5JsjdkFWM9Rgu+pVa9jSJRpnur3CjtgBsZuo=;
        b=KTO0USD9ERuB0IJdscodQH9ytQXUDDKlEY09zuYYvOPaibUOA5uEmtzBPGviUreSFx
         VTqyfOewno0ejSTfphjz7pM4pzTdxknXG3wDO1t0EV6cCbWEAzvi3S9XQYfMPMtdPBpd
         66XHTk+iyXknSSu8d/1HbBEnfa9PWGKYrjE7zFZ9yT25EHRXaDRTO5IZcdi9CWfUKe1T
         oqITyYRXG6WA7eRjh6fbkW9zgHMdndgwH3ZzHbvxIrfI9LZvtzLDMdqkgnk+fOzXim2T
         4iGgiWA0mXbANWsgUw1EncuRagLm9Whp5VDDCNK7ISm+Jslwt+eoVyNqnRgRPTnmBQKY
         4t1g==
X-Forwarded-Encrypted: i=1; AJvYcCWdJQ52D1WEqDE4HuJCOAWwL42xI9ZRQUQbmz9NEJTdGUoheiZw1CidA0oKzLn1cQ1c97svYvw3q9nNond+Yw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywvv0WD8trd/pHtD+EFAhZepW5l117T58wCQ3i/uH3sWuK6Zm4j
	B2bUdNZOau16BLZJ6R0AI0QO5ieFwNoXWkDBcorsjy8fHVgAtE1NcpN82w2ilw==
X-Gm-Gg: ASbGncs0b/gEVZu+fd5BUGW5Wq7NiRWrXAr96M0xHvoWIOYcVvPy4uo2i7sQpdGeBa1
	1CvK8qqwH62CYMb36OK1H60ZAFX06DJly2+0wYyGIo7vkC2N2fwU+xH087R9Sp+yBGzWrL193Uy
	tRq43z5YLkaZ4a3MiraFnlfv7P7QzS8Tz6xl/Alug4owN9MP7s8k/YSLo5ii0QTLWvE0CPQ3ATk
	/0kNH/P4QGG5U0qmuSbgLSuqLkjSeSPvDYlcywLumTbCeTL8FWBlhJULVI+WiuuTWoP8MtJ
X-Google-Smtp-Source: AGHT+IG1WT2JNFtTZJQaCDx3/CWxE46vDhlGZZ513ZUlC7xM4jD1E01HlR26Ok2ltxq903JY3J5PNA==
X-Received: by 2002:a17:902:d583:b0:216:53fa:634f with SMTP id d9443c01a7336-2166a063a7fmr51209325ad.48.1733815937970;
        Mon, 09 Dec 2024 23:32:17 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:89ce:2db9:f7d5:156d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f09146sm83693295ad.199.2024.12.09.23.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 23:32:17 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wenbin Mei <wenbin.mei@mediatek.com>
Subject: [PATCH v2 0/2] mmc: mtk-sd: Limit second register range to SoCs requiring it
Date: Tue, 10 Dec 2024 15:32:09 +0800
Message-ID: <20241210073212.3917912-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_233219_117667_CE21E5E3 
X-CRM114-Status: GOOD (  10.49  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Andy-ld Lu <andy-ld.lu@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changes since v1:
- Added MT7988 compatible string to list that needs second register
  range
- Dropped comment about uncertainty of MT6779 from commit message
- Picked up Angelo's Reviewed-by

Currently the usage of a second register range for MediaTek's MMC
controller is seen only on a few platforms. However the driver tries
to grab the register base regardless, and then ignores any errors.
This makes all the other platforms that don't need it produce confusing
error messages.

Instead, make the driver only grab the register range for platforms that
actually require it, and correctly handle the error. Also fix up the
binding so that validation of the "reg" property is as strict as
possible.

Please take a look.


Thanks
ChenYu

Chen-Yu Tsai (2):
  dt-bindings: mmc: mtk-sd: Document compatibles that need two register
    ranges
  mmc: mtk-sd: Limit getting top_base to SoCs that require it

 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 10 +++++++++-
 drivers/mmc/host/mtk-sd.c                         | 15 +++++++++++----
 2 files changed, 20 insertions(+), 5 deletions(-)

-- 
2.47.0.338.g60cca15819-goog


