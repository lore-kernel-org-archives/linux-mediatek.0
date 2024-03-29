Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD743CD1283
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 17:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcL5hqCrDYbrBJKg6yubNMlPGipEeaEcniEcZ5X/ejM=; b=KP44jtu6S0zBE5pmTlayD+3ort
	hYpbxvgyLsl0Nv/vXoViko7uv60Ia/kllRDR6jdOwsZubSj+cD2+lFCZcSyUdjFzAq1NTLRmLM18h
	/nQ6oTMuymj4EheeRHRTB3pzUz3jFMp0AX3qu5X2UV+px9W2/ek/4zVIqcPo6Pt4zNQ9APqfGa7Lh
	wjnDZr1tGmb9j7gZPJc+/LMYcsFymCvpaupaX/YuOx4C3BL9U7yYt6Vm2RcNI3p3m7kjbz/Dilu/y
	M1fTHJdtuElXSijVJs+XPWAphm84WRZB+f6plnrd63TXlENzgIy2WeE/f+iy2r5dnvF10saZ0cOCM
	lkCmvQWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFyq-00000001SwJ-4AWg;
	Fri, 29 Mar 2024 17:25:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFyL-00000001SbC-34XV
	for linux-mediatek@bombadil.infradead.org;
	Fri, 29 Mar 2024 17:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LcL5hqCrDYbrBJKg6yubNMlPGipEeaEcniEcZ5X/ejM=; b=TLlCL8CFEDhUtHyz9JflYWT5hR
	xzmCtxx42Kicc+Zjafq9vxNf5RDoSoWzmvAwRuU1faqHaSzo6XgkbeyApCcujQhNfUqVHulsZWEv4
	oRPXk4G+mxG1D1ZTkDn2xB3oy+YfS12ZFqyDsZFf2dqy0BZVMggsoFx6ehS5eso08SM46xjOXGnH4
	nRm1PFlNPyJgBW9S3d6oGGeYT1B8IoW7kYC5pIxKgAD+HTwMaC3ICMGVqZ1ytwmeWiPh9dzm14SbT
	XHxntnYKwfYDEtzicvYrhYg6xGW0ktkNqqdKyqrpJWPcvf6c0b9zdo1JnfLzgNZgYGT4cyJ/qT04w
	fjPVgKvg==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFyI-00000001fsA-1xe8
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Mar 2024 17:24:56 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-41550858cabso3985135e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 29 Mar 2024 10:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711733092; x=1712337892; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LcL5hqCrDYbrBJKg6yubNMlPGipEeaEcniEcZ5X/ejM=;
        b=x9f8uSQ0H7yAxg/pqq7N0kaBLG11rQ7lDfHOOOJYFPdrwoisRZrgG8BfvWMdrsfkwj
         7ocl+vXQHR3RzV9Glfx09sfebNpLU46cv4Rn15QvCJVRxxd3MoWMr5JtMd00mEa2gtnR
         s3I+1Rgiz3Ps+AgF5240gD2U1thHtPt6DbnDgUBTRA0UB3NlEk2dWGwoWD6IuR33/SLZ
         H9Gc0YCI7fO2btVE4OTqZMRqyeG9yKKwY2tiyhJUaRTCdme2PpY6UZoTGoOh6oiEbHH/
         a7S+mBgnGYUKWhd+39wnz4X3L19W2FHUdWv4h9v8IqByQO/ffWmHil8w5X7JzEKR+I0n
         IXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711733092; x=1712337892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcL5hqCrDYbrBJKg6yubNMlPGipEeaEcniEcZ5X/ejM=;
        b=EeGXG2tKfBAr1qvAmaMCVJE4afR9ASPpiDrrW6FuUzXspsjWjR8BJ8VCl9WKI9Z9IL
         AfPMz+ZSugZLfqSJEFJ8OuJ7WB3pxr0bvwXNhDAQI9N001OpXLnRtCnh3dh3GFC+LsKz
         h+YjXjaUX3nib1BWHsnrDHQ+iihIpSkbY/XXh4PSv4wryWk1imIKMyEnoZog+s8qDr3v
         moFGChQJFYODVxXDWgcccO4O73NWo15Fg4rfoTs3UY0kDE7c162T8rAP+uKhygrAxlm5
         dCUfQw7WxQnf+l6zuXi1Jc4QLmbmbfi8cnaoTGu8HP/bC0qyDbW6uEq4lhRGfKlKpLM/
         qiVw==
X-Forwarded-Encrypted: i=1; AJvYcCUitM54WCgJ31BSFEz0Xfdinsy95trdccflfxjzpMLn/4RrP1d6fR39IrPA13hkqOC84FRMhC6Q+CS0USCBCBOGA/HpkU2JPUSzqQmRDFlJ+HZj
X-Gm-Message-State: AOJu0Yx/VB5gsY36b6VFg5TY/d0Nliuzj140aTQS6zuwiP7sEYm9C9cS
	SwU9CBcfjaxHP+PYXqEDKu29ydH0Hv3yQ0UXqddzgou8lRdrztaV8KbTIqlSk50=
X-Google-Smtp-Source: AGHT+IHndS8nu/3l0eb+ocEil75C5QdKWIieUdDFgHlm/5IXoaqNdJplBaNZAa8mBAfYg5ACllbteQ==
X-Received: by 2002:a05:600c:1989:b0:414:93df:bef1 with SMTP id t9-20020a05600c198900b0041493dfbef1mr1962459wmq.39.1711733092656;
        Fri, 29 Mar 2024 10:24:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c470800b004149543c82fsm8491069wmo.39.2024.03.29.10.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 10:24:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 29 Mar 2024 18:24:33 +0100
Subject: [PATCH 3/7] bluetooth: btmtksdio: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-module-owner-sdio-v1-3-e4010b11ccaa@linaro.org>
References: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
In-Reply-To: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Arend van Spriel <arend.vanspriel@broadcom.com>, 
 Brian Norris <briannorris@chromium.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Pouiller?= <jerome.pouiller@silabs.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
 ath10k@lists.infradead.org, brcm80211@lists.linux.dev, 
 brcm80211-dev-list.pdl@broadcom.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=688;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=noXTH8RgGL7KawLoBkrEaQ5WJXIVuj5AlJL341+SDU8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBvlZscrGsmgUvjqJCgIZjHOxIlihzoLBO9BSY
 fg3/UkGg5eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgb5WQAKCRDBN2bmhouD
 10WFD/44MFDZMNzymsgjUnQ3eQYk9ZYGtWq0RvUzVCTg3RJAeC5QMaYgGOPTdILnysbGdc5pw1Y
 8btwMyBPcLE0+s0b2snLnak9o3VA/IQeBEo1wDMxi6SUv+Spu3/w+KT9HGF/5z1M1+7MeGKwFEx
 aegcGkBu2NQ9W5RUGN1mN09SJA6PZWzNR2bhc2K5zyA5gCF85RV6wBVAEkfyp2dFdlDxer42il/
 eHnLXd7fslojOU151TEO4etUgSfgbnqT966M0IFu2V5y8n5Gep05sxzB7lUOqGctZlHQWT4DutR
 7G/TUMAyKFz8cq1YdMmylWizy5bxD/cWMndC78oTGKNv9geLyTz8+zN4BigpeWd2CNAF1Z9OQk2
 rcahEfMMs/lR19mqhB/vi87YmOv9DSxXp4MJ8jlft2e6JOcnfCQbEuMKw+N4Kn8GjTipxbHuj9v
 VCZ1adA4/dSIRgnnqChOhoeMMNy/e6c3hf+sYVstG8c5vjTvVISk+yC26FmrnA0yBTj9HcycA4I
 zBhHz0yp3PRxoI1KM7w4XFdpK6Q1fzxFe1PFhEg5zyZ6z8dOBPLKB3q65szRxbVauRRHJmAB5HS
 7YfCAGceDF7Q5RxbQT4890fa7t2cKuJGnnZ/X+hpW4xQXb+B9D04hmee0d+LsdlE9/1XcXZBGDW
 /rAI8sr/cdlqF3g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_172454_628804_7A903EBD 
X-CRM114-Status: GOOD (  10.28  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Core in sdio_register_driver() already sets the .owner, so driver does
not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/bluetooth/btmtksdio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index ff4868c83cd8..8ded9ef8089a 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1519,7 +1519,6 @@ static struct sdio_driver btmtksdio_driver = {
 	.remove		= btmtksdio_remove,
 	.id_table	= btmtksdio_table,
 	.drv = {
-		.owner = THIS_MODULE,
 		.pm = BTMTKSDIO_PM_OPS,
 	}
 };

-- 
2.34.1


