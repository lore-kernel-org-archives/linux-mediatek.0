Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA71C79F82
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2026 23:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=smnQky0ErsfDpiZznR4+kV0USKaVnCb3aDkonGaPobM=; b=NNxb175jg3Yr520DCTxIhNazIU
	8ELsqxRMwl6/VJlF4DBF6oAg2HZxPtfYgGrXwtMyPoV1rDkqsUur7Mw2SQJYANm1r+FX5HVNwQ9dp
	FBrcbXoZjPQh4ljwlDLGCg7ZXrNGtC30TMIG1ksis78/WyPqmitzO6Zm/YK1MfS5ymGwEbU+s9upK
	1a/j5JvQd4XNork622Ttutl6PFKcCUTTXCJeO1tVf9D/s3p6BZA9G8M1cLv+EpqAOUhkHGhKfAaPd
	cyrWcTjwgBv7BG0jGzqoolQq5j8wpfMGr2xYQUUPVDRr/dyV1I80hjjlXbKeNOU9EZVlP5n3C3pUi
	H4yDfOag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x44zl-0000000ARJx-1TFu;
	Tue, 08 Sep 2026 23:12:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x44zk-0000000ARJY-2FR1
	for linux-mediatek@bombadil.infradead.org;
	Tue, 08 Sep 2026 23:12:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=smnQky0ErsfDpiZznR4+kV0USKaVnCb3aDkonGaPobM=; b=ppdjk4ZnNzRzMvDSci/T+k5QeB
	q4zeTaSdCTY7F7GKn8Us7PHjQTf5vMTu/3V2WCtrHgVSAno6MKkdexJFmwIStzPLFQ8HWRRmCgjSp
	SaUTAbHKLGGkPPR34OXMYpM5n6h7TmGXx4ToZDtc3I1QNmABS0ovdl0iA11T/qDXoRIeC6o3OBRJe
	oBleS53n2itO8KbUv5F9D9fJAOgMmFpRF3XuFsxyKu4ooz1Y7gKbjj5YX7/Mgm6zIxXETPzar7ewI
	I+CM0Ulngjx3UICwgWiaQsEIPGqhRfWpOLj8OXaHKvwSMxS5nnET7pe3wPZWA0O1HBSIN473iaQUv
	ZKiK9jTw==;
Received: from mail-oa2-x00.google.com ([2607:f8b0:4864:30::])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x44za-00000000VCm-0L7u
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Sep 2026 23:12:49 +0000
Received: by mail-oa2-x00.google.com with SMTP id 586e51a60fabf-451e8472960so4161634fac.1
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Sep 2026 16:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788909159; x=1789513959; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=smnQky0ErsfDpiZznR4+kV0USKaVnCb3aDkonGaPobM=;
        b=nZr0QeLWIHTrVUIWB6ErwfqruBKD5kUiwVuo0zR4dX6qE0jH6BFus9HIFSbBwemWt/
         JZiJORgbHhNJAjw4F11/h1sfXb09GaTeKhlN/K9uNBGsyMQOoqSLBux2sScmKEtiNhXC
         /E1xlhzO6ZeTVydV6tzZBpuv6u+2FX6rbMvWcGlK9zG4oYLYOBdJVBNcmxINCUNOWsjm
         NK9cV01xB7E3o4/PLC8jFveZ6WxigMJMw7wVAGFbveV6ATopIjWyMYJgu6APHbniTE65
         JRZoIVbkJDJG1/bH88YP7uB3sgt7bEKc8tEHLt86x5Q9ZDiu0Y9p9RniLzMjvIrm0+O2
         KY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788909159; x=1789513959;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=smnQky0ErsfDpiZznR4+kV0USKaVnCb3aDkonGaPobM=;
        b=bsZTOOTb/mmjvKwceQwCi+q4srnDVfxap0jzOSEFfnGSSd4AHWZ8V7WlHEH8arYvwK
         nMEjVwv/KWfbUI8C9VHdq3JVnumQ/ZiFU8jgjM4mr3cWYVYZYAf4neXAvY+TcHX3uR0G
         QpNZIYW/R0vlDbMpR8ipxo2Oq9N7jGVZDFOv66RwqM97W3OcukTmH2cYxpl12Si7O/YL
         /gJaBjeikKEQPbpZE2fCk6tvAXsOmRI5EmwZZthfQEqHxY8h4IuL5Cqb2xvG8gfmScjy
         rUnQgd80HkJdA1foU8gs7JnG15Y/vakqtsyUUBmZ3tKZrJdoxH3+GPFh2p7XyrK+H7qe
         0e5A==
X-Forwarded-Encrypted: i=1; AKwUvBwJnwXAJqeiZO7XqzsJVfqdT2KxZ8e/GleYYh3SNLe5gfLVQy3SdeHFig1TnGmv+XKmcsgeV6KB0JJ+G4/aBQ==@lists.infradead.org
X-Gm-Message-State: AFuF++k5FJcejFgIuTUE5kPGcISgzUENeKq7Xjx3BSHbfPYtbeXFbfsk
	kaeCCKfvXyOBHjTfzd41y9eJ1Cz11ZasD4VFgpij51QOJEUCRqScO5KR
X-Gm-Gg: AYBFou2JW1DzOW7MwOXcC4Xwq7C30QUBIFV53bM0GWKnk8IZl+cKVCMseumTzwCr1Vq
	LohVE5v9ccsulWzxZvLmnM43U32zFCxIRbSxK8nfExaAG+e4ijScu3gf9n3aeKfnzRaCIxY1utM
	0EpzFu5tCwTftr6al5WUaVYHG13NUL4QJ2gaQwcFyx3u8e6fVPEfdcI5z+jrE2fxB6zP9QsEvFX
	3kfTtjndkTnUsmaxW21AFKLitJI5H/cQQyHlMdKtwV44dRNSIfjVYz11m9cSc1dn0Q6xjGHg7su
	Npk49EdNEeMSVUgmJOpJDxrAilfCLbltL1MQD83YcaWEmpQwYBEiDTuYZJtnZJjy9pDfPwgdr7t
	smTVyOZ10NsCDCDQqJjDhIq4pa64/7llIrwv5VQoNGKRh8Hblk5SzObtbKTguo4vEOUv+tpdOIr
	AhCscQDyaz5dGdsiJvZLirV2aWkd2b4HQGlH/VIlehgRUptIxsLnO5Yrn/PNIt4GfK0Qk=
X-Received: by 2002:a05:6808:c2bd:b0:4b9:a8ac:482 with SMTP id 5614622812f47-4b9a8bb6aa4mr15564787b6e.32.1788909159168;
        Tue, 08 Sep 2026 16:12:39 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-475523d1dc5sm13776680fac.2.2026.09.08.16.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 16:12:37 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 08 Sep 2026 18:10:23 -0500
Subject: [PATCH] usb: mtu3: fix system suspend in gadget mode after soft
 disconnect
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-v1-1-3457dcea9f48@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNywrCMBBFf6XM2oG02mL9FekijzFGSBpmEhFL/
 92oy8O9nLOBEAcSuHQbMD2DhDU16A8d2LtOnjC4xjCoYVKzOiMbroRS6Y01S2HSMSSPsdQj3sK
 rLZIpOaxi0GvnqWBcHaGdZjv26mSG0UCzZ6Z2/5Wvy5+lmgfZ8s3Bvn8AkI/oj5sAAAA=
X-Change-ID: 20260908-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-c69c5104b25b
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Fei Shao <fshao@chromium.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788909156; l=3498;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=+ZjLG77YKfr9IPV1oRcpyx+bGhfiK19WyzbxnAw1Dlw=;
 b=V2O6cHk26Nxt8LbULYU/sEf44lBkzKUl3wK7GAWx+IQ9lLvhe0k0Y8fzsYxUfdNDKEqL4tmi3
 8GpBdhfJQ3hDKeuMLeV3szySlDOsdovXO/TPdutx5Dhf0d/tFSGylLR
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_001242_462698_2FBAC671 
X-CRM114-Status: GOOD (  18.91  )
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

ssusb_gadget_suspend() removes the D+ pullup for system suspend by calling
mtu3_dev_on_off(mtu, 0) directly. That writes the hardware SOFT_CONN bit
but leaves mtu->softconnect alone, deliberately: ssusb_gadget_resume()
needs it to decide whether to pull up again.

wait_for_ip_sleep() then asks ssusb_gadget_ip_sleep_check() whether the IP
can sleep, and that function tests mtu->softconnect -- the gadget's intent
rather than the state of the pin. So it answers "pulled up, the IP can
sleep" for a device that was just disconnected, and the poll for
SSUSB_IP_SLEEP_STS runs to its 100 ms timeout:

  mtu3 11271000.usb: gadget (high-speed) pullup D-
  mtu3 11271000.usb: ip sleep failed!!!
  mtu3 11271000.usb: gadget (high-speed) pullup D+
  mtu3 11271000.usb: PM: dpm_run_callback(): mtu3_suspend returns -16
  PM: Some devices failed to suspend, or early wake event detected

and the suspend fails. The rule the hardware follows is stated in that
same function: the IP cannot sleep while D+ is not pulled up.

On an MT8173 tablet (Amazon Fire HD 10 2017, dr_mode = "peripheral") this
makes system suspend impossible whenever VBUS is present, which on a board
whose only USB port is also its charging input means whenever it is
charging. Unbinding the UDC, which clears mtu->softconnect through
mtu3_gadget_pullup() and so makes the check agree with the pin again, is
enough to let the same suspend succeed with the driver still bound and the
charger still attached:

  gadget bound   (softconnect=1): suspend returns -16, "ip sleep failed!!!"
  gadget unbound (softconnect=0): suspend completes, 20 s of 20 s

So record what mtu3_dev_on_off() actually wrote and test that instead.
Runtime suspend is unaffected: it does not soft disconnect, so the pullup
is still set and the IP-sleep poll is still performed.

Fixes: e69027c25361 ("usb: mtu3: allow system suspend during active gadget connection")
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/usb/mtu3/mtu3.h      | 1 +
 drivers/usb/mtu3/mtu3_core.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index ba5a63669e5f..7f4fb87d8438 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -361,6 +361,7 @@ struct mtu3 {
 	unsigned is_self_powered:1;
 	unsigned test_mode:1;
 	unsigned softconnect:1;
+	unsigned pullup:1;
 	unsigned u1_enable:1;
 	unsigned u2_enable:1;
 	unsigned u3_capable:1;
diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index a40bf5bad2d5..5ce61240194f 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -346,6 +346,7 @@ void mtu3_dev_on_off(struct mtu3 *mtu, int is_on)
 	else
 		mtu3_hs_softconn_set(mtu, is_on);
 
+	mtu->pullup = !!is_on;
 	dev_info(mtu->dev, "gadget (%s) pullup D%s\n",
 		usb_speed_string(mtu->speed), is_on ? "+" : "-");
 }
@@ -1023,7 +1024,7 @@ bool ssusb_gadget_ip_sleep_check(struct ssusb_mtk *ssusb)
 		return true;
 
 	/* device is started and pullup D+, ip can sleep */
-	if (mtu->is_active && mtu->softconnect)
+	if (mtu->is_active && mtu->pullup)
 		return true;
 
 	/* ip can't sleep if not pullup D+ when support device mode */

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260908-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-c69c5104b25b

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>


