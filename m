Return-Path: <SRS0=SQT7=KJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F39A2C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 12:22:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B79F6145A
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 12:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B79F6145A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TrSD1JMd0wk3SPmgQrsKvVtpy82V7AcDW0FNRjMZ4dM=; b=TlTYDEwI6VWMYZyy4XLF3vbw6m
	XzmJ7MvYx0WgbYJQ3jhF2HTUEoxWwZQxGoNCX71M3ibEqIRhKTWCHfoghhhRDBh0JqWCAFDElw1QI
	udRaNlrS9glS+eU/YxvHrIBkd2a1G3K+jBgAZe3eXsGX+9gvnI7AZp7Rz7YGkU/gjMjvd7eHw2wYW
	AzIHSf7XaiGJAFJQpGwUQLWK1GI2Hz8ch0xJBfe+VXUaMbvpm3oZ6HreiO2HTOAk+ehMoiC8jPtzM
	DcRsOBUPv2CBArPqhB6IDc/WDlbGWmQbJfbHjovKJsecPbz517x+jX95WijHrGeKHhVG2SsZGhx3L
	DQ9GpebA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhWpO-0080uO-IE; Fri, 14 May 2021 12:22:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhWp9-0080rL-St
 for linux-mediatek@desiato.infradead.org; Fri, 14 May 2021 12:21:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=KAk0g8z1opxg9hfh3kwLSOD5nwvqQ9x4A08bZ0cKY9w=; b=DIF+DiQWeyEsnWvuffjfoZvVF3
 ZUKaAIecEKvMYOIXDEpC7Ie0UvP73Y3RbgqXfpgjbmM6rIRy8XcQ50QpZtYqpa6VrdOwQJTNLMBvs
 mPZIi5VidPbqpTUqKeMHQMsfu6mLxQtsQAFvJiMmAZ4yKIlaGx8nc7ODJsBgOPzZhjlaJ9rTE9Nlq
 0+xYu7adkBNiEoDOwhDNURhZbgRk5OH4Lnt2U7mCRTPc1VUNGroH0BfzlYij4y0xkDueNDBXoNogQ
 0/CBb5eG8KEpZPJlUAPQfrv5SmM5zYoEC9bksrhbcF0Ogl3Z9cZHFYuVvy91NOl2MKrujUXFeQjBc
 YYq5jY8g==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhWp7-00By5d-EI
 for linux-mediatek@lists.infradead.org; Fri, 14 May 2021 12:21:46 +0000
Received: by mail-pf1-x432.google.com with SMTP id e19so6265208pfv.3
 for <linux-mediatek@lists.infradead.org>; Fri, 14 May 2021 05:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KAk0g8z1opxg9hfh3kwLSOD5nwvqQ9x4A08bZ0cKY9w=;
 b=Vv7GxJ+avWscMnlmLiMf6D2oS3wGO1ZcpThAMmHGb1DHdUM4W5Rz5+MqtZQQpZRUrS
 xrc1dl/g5MLarwNbqEr652jU1Pt96IEPpDYjqr0wJ916PYRX8DkDHb6EAbvUZ1vg2G5i
 yZi63vZzjFy+3tC6zNYdS35rQF71aPLopWObk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KAk0g8z1opxg9hfh3kwLSOD5nwvqQ9x4A08bZ0cKY9w=;
 b=ZoXB6JGWn/3k/qmv+oHNgyFBMVlKvPQ7wUHa/VPxenh+Vf3PlJYwcld8Sqgkp85xVh
 b2kPmKYwycspIgW/5LDzreADKjeYn81mZwIWPRQ/M4aEb1cOqL5dNm8msV50InynJy9w
 A/C7vhe74OcfHLUnQntXS3F0N3oWvHFth0ciyvjWQ8m8IUOfEzOS6ui1EoYUH0Nqjjyu
 GoC7UFVn2LmQNgogUDvkbvuJYwVZ1Q1PUJqkf8lZwM964PdMg5dVjGS37LpRvyBlHw3e
 BDl+Ks1WL8FUzxf+9QsRu3hgDu8AHU4IRUQCZXaNc8hZLcr9s2XPCepcTQqPxbMtUmkd
 aGMw==
X-Gm-Message-State: AOAM532XbbIWQjGAg2igLbM2SiV0lGVvtBgaOndu7iboDwlDcPDMjUVi
 RQmHniEOQGTm249ljmgtAU/PqQ==
X-Google-Smtp-Source: ABdhPJwt4o8oA04eyCHn4vJGf09Zt3E8GowUbhMUPyQDnK9/ps6C0oIEWEaLnH+zB0o3wMGm5mLzZQ==
X-Received: by 2002:a65:68d5:: with SMTP id k21mr40662150pgt.383.1620994901377; 
 Fri, 14 May 2021 05:21:41 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:b:7641:4b1d:694e:6ea2])
 by smtp.gmail.com with ESMTPSA id u17sm4010117pfm.113.2021.05.14.05.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 05:21:41 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: devicetree@vger.kernel.org,
	Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Guenter Roeck <groeck@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Jiri Kosina <jikos@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Ikjoon Jang <ikjn@chromium.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [RESEND PATCH v7 0/2] Add support cbas tablet mode switch to mt8183
Date: Fri, 14 May 2021 20:20:48 +0800
Message-Id: <20210514122051.266169-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_052145_489304_50EB23AE 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Adding a cbas support for kukui platforms which has a tablet mode
switch through cros-ec interface.

---
Sorry for resending v7, I found some CCs were missing
and errata in email addresses.

Changes in v7:
- remove a label in cbas node in mt8183-kukui.dtsi
- fix an erratum in commit message (table --> tablet)
- dt-binding patche merged altogether with mt8183 dts

Changes in v6:
 - Remove a label for cbas node in a example of dt-binding doc

Changes in v5:
 - Add missing blank lines and change the description property's position.
 - Add a note to description: "this device cannot be detected at runtime."

Changes in v4:
 - Define cros-cbase bindings inside google,cros-ec.yaml instead of
   a separated binding document.

Ikjoon Jang (2):
  mfd: google,cros-ec: add DT bindings for a baseboard's switch device
  arm64: dts: mt8183: add cbas node under cros_ec

 .../bindings/mfd/google,cros-ec.yaml          | 20 +++++++++++++++++++
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  4 ++++
 2 files changed, 24 insertions(+)

-- 
2.31.1.751.gd2f1c929bd-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
