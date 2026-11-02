Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC45607229E
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2026 16:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0WkvEbzW;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kd581xpS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=49UzIiAo0VYsR6EXPEJbJmUgWYtE+uEvjPXao/cXtos=; b=0WkvEbzWs6GJUcSvZipXUrhWU4
	ag0TSY/T+u3qYncLVuL+OlF3gouOFOy7pg2yIZzJRhgxRMjmkfDOTlqVWXyrgclamwLejkam0iQhe
	LQ6R/jE3ixvpk1Hf2BiVHCSZKCkE/7ZuszqtpIF7M+yY9exUYWuMRT6jOLQOWSsrAmMNVRXA1AK/3
	JrHlOiFanm5nxzQunKnr5JuoXoLbY0VNDJIXtKGdA7B0SZyl35YbjcGaol9IVQNAJh5Yoam+jQpNv
	iKjQCPPZT43lff9qexRhDwshBVIKrPUohjdlwa5RApTsbRDdWnH0ZblpsOM8owdD4NZuwJOA653fk
	cTAa55xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuuK-0000000HIef-0oHf;
	Mon, 02 Nov 2026 16:29:16 +0000
Received: from mail-oa2-x0a.google.com ([2607:f8b0:4864:30::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuuH-0000000HIdZ-2uga
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Nov 2026 16:29:15 +0000
Received: by mail-oa2-x0a.google.com with SMTP id 586e51a60fabf-49e545b61f6so904719fac.1
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 08:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793636952; x=1794241752; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=49UzIiAo0VYsR6EXPEJbJmUgWYtE+uEvjPXao/cXtos=;
        b=kd581xpSD15XbJdlYhi9hn8DhABbPi0zQnXBoZiwHVeO5MhA4JEqiXOkEIy1Eq7J0o
         f0nXKB6mEH70x5PSu7p+v3SOQiri0PcbPJIE3Qh7IoT53Qk7kLHT6pIjAEOGPHPWEBlR
         mUyqMxczbUXMNscmPBswTvZvzf9ER4NAOVXXmpyN7Ok2WqfMNXfpV+Q6eyFhIc93XcZT
         nOUgV8GvC7K1GAkENAGRx+wxzx4lqGdA5NKDs20NiwfMJ+nLFAHvWErk3+FlHvw2Fwoe
         5EdJZ3/UilfMZYjgHJx3zD9kUVHUfS3fSBaag9tZl5wwWPhkOkq6tQfAVdfxB5gIgmJK
         /MdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636952; x=1794241752;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=49UzIiAo0VYsR6EXPEJbJmUgWYtE+uEvjPXao/cXtos=;
        b=lAZ/8gD2tM5pUn3/VbTdMGwV1YeWy3rSrTgaDOGkGhNzcrr5JhL0V9U+lgD0PyZnw7
         Aem3587HE/h8fslf7lCm3nxchEhGi8POi367y3ByhLwFHAPNqWS+Jon04Y9Ch86d/asW
         o4HkXYg4mIOl1K3U0ngoI4k6a9+YYtaHC02gZH1pPSKaP5RCQDaT7I3Wm/7X03HTzkTR
         MsvOgTi1zGcuDst8/J/cuiX101o5nU9wswsX+QuAAkX8h2P+AF7zwU2Qcp5CE3wDR+Ks
         EnIy3FzmX8wReit58BK6vwY5kyRUcl+BLS75tDlwIlP8kKMMoq3iuFY6kvhXR7yhcZoh
         t3uA==
X-Forwarded-Encrypted: i=1; AKwUvBw4G73Umpp/DBLzfDLvn6zbVkHaTXQ64XOyGjTiu9otcSsx9m4gWM67ta3HMGD1EUZK2/ILkt26Eb8VBjcAlQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+T1RTMXidFMOOrnWzDi3qX5TUPP99SrQz/CI/kgHdMaEYZrJk6
	GRqfnOXe/NakVf8gZUf8KyjbL/VddEWqNww9tVbKiVLejQKM67+44pMH
X-Gm-Gg: AYBFou0FeaDXPCj6pxkUrRZYfLgXhiANG4CqQdtjGBbySsm1P2VGHUAZXnIbOXna87W
	rZPzY2aG12n2QEktLpiPuyYpuu2F71DbLaqQcPLSxx53Tm/+8LMmPWNg/YuuAhYxLqL37VVoflh
	amuClMqA7mwysUptTxvDKVRQQTaPcMV/E8V9+8mZBP/qduN/0p7OxWnT+AUuJNRUxljjOHH6n/y
	1ArIJLl1ezWd0X3+rh2sFJ+aiK4ou+aiaCp71hhXHqmnDOEh5HY4FZotlZnDyeq5zY6VYKQ5bwU
	w/4H3v1DLnhP/qNZhUNgPdO120frE+VCfn9bO/2j6tDo8x561V9OG5mwrTghWT2WH88SUrJ6dtd
	6x88wGok/PpwkAyc3KqRik+nqyRTRwwsBkn0yJripM2VAlL7qZURBSjsXV6VSXO474ybMbO8rUR
	K1qdvygYm7YuMbbGLJxndgSFqyIJHN6fF/E3DB3QWQU8m+G9J3GSYXlYnMmYj+YE4AYYBk6yXGW
	LfaV6WRsFQOx5ncOnGs2gVL3bsEAlqEdvARrTBYp1XY9VVY+NarGb6n5WCLAxmQQXcqR+NN2m6x
	ole0wftLffL3E2ppxU35m0L1wobrGElooX6/gLW2wiRhhGbsiT1ZwsAViojSS5R9bvvxXoIiIA/
	A0ZohV4zUPbRvXmaL730=
X-Received: by 2002:a05:6870:2dca:b0:49d:999d:c25a with SMTP id 586e51a60fabf-4a90729b213mr5773692fac.6.1793636952420;
        Mon, 02 Nov 2026 08:29:12 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a9219148cbsm6536719fac.3.2026.11.02.08.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:29:11 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 02 Nov 2026 10:28:58 -0600
Subject: [PATCH RESEND] usb: mtu3: fix system suspend in gadget mode after
 soft disconnect
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-v1-1-70a74a392015@gmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Fei Shao <fshao@chromium.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793636950; l=3537;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=42nYDcBAxNvHgQbbkGEcmz3UGXdz42wPE9jsdKzwvQo=;
 b=kC0RERhuUqoTk8as12WfjWIGdzHEwAzcXv3BQz1EAmrEV2a2RHogHoPYdNRcJAHP1bpdGIw29
 IyWH+b4r1bkASVyiHtRjVZPsvygEInH+Vw97GdpHLq7l7zt7e5pSCGg
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_082913_748912_68DE6A6D 
X-CRM114-Status: GOOD (  18.78  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


