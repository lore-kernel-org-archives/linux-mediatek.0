Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF696C9832A
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2026 15:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=49UzIiAo0VYsR6EXPEJbJmUgWYtE+uEvjPXao/cXtos=; b=QLdTVki7JpHEnZaj+QBWjnXbhq
	g8H+qlSL+DAYP4kCPJcgKrjDTiTSNiPefCfpDmPXHTPGhDefXqu/P47cAGNJWgLxeknbFXWSntoBK
	K5bXVPEYawZWzEJSDel14cdvcsZWRL+3daovFYTYV0dWB3FfPlGX0e4gh8NcHLGbfx0bNJSnNcJRF
	u4REO6yg/NL+NDCReKNb25dH7/yX70V6cckXtEf1xYlrYPQ949+Xp9pQm+84Wb10SymxmoxFZ06xa
	rfMLZJp6gxFMtKdcO+Wl9HjHLim9ashiRuAHgrX3e365FcftJYk/Sd1aVo5vt5vxNVrL1KUIxKq8h
	TMtUz5WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZM6-00000003sAA-1viu;
	Tue, 29 Sep 2026 15:02:54 +0000
Received: from mail-yx2-x03.google.com ([2607:f8b0:4864:41::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZM3-00000003s8O-1W8z
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Sep 2026 15:02:52 +0000
Received: by mail-yx2-x03.google.com with SMTP id 956f58d0204a3-66fb34fa3b6so1248900d50.0
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Sep 2026 08:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790694170; x=1791298970; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=49UzIiAo0VYsR6EXPEJbJmUgWYtE+uEvjPXao/cXtos=;
        b=BUCmgg2sJFO02Y7hW08x3SVMQm4Rij4HHq0pahUJY1CC93irJFDkZtW2QsS+5jDy/w
         LyCIaXR8z3yQ0cLL536sXvG/jPm12f5XNUzJ28/5XNmlgQK5+PfutASlHq0e7XRNApVM
         g30QIukXBnRTxYv1IkAwEj/WECGmwxqLxsh/Q0ZFZEw3F79VLOETQoR6l7M52l8E9zoi
         wAEZWbWMweAeO49coYpHsQVPKsAPb2HvaEJzl6Chf+oQpZN1vcDNKv6MEPAdnYunDJvK
         JLakIcs5E3EwrRkmphkFCE5nWz+BHlQ9Zc8z0gZOg0J1iLItuq8y1wcQARdYvuiXxcHC
         wk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694170; x=1791298970;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=49UzIiAo0VYsR6EXPEJbJmUgWYtE+uEvjPXao/cXtos=;
        b=Nmi7ywhBJ1ZFNdvuEVbLq76W6hK1ccc24JpuNUx+z2krVpp9udz9IBtqaTtoX4Hzkv
         V094UlhhVllUSLwBgJP8DpdtGpUEsQI1MaXI45lIWsJJMS3I7zoxsyJ6jU9Ou39zPIEQ
         EyvfOsDhgxdvAI0AhcmCv22HmZlqzVTaYjBHl0qtZEyCh+MlsjP+TUYgG9oogA1jgWUL
         7CS4DNtLvkhWq+yPZMscnvgy25gPjrINoYYZxKQuVMpwvAdnUCKT1R6hOfGDLW9mOwxT
         TqZr8BOktTtPSWKjMvc09+yHKkd2vZJyr7KsMYlOhU4LNCttppcp6G5UMMQVXK1PNxNF
         3qXA==
X-Forwarded-Encrypted: i=1; AKwUvBykglpuV8O/zUawQ4f3sdROH7NbIg36WzAcwkWNoWEhQILX+uS45L6l2jsrND4HmHYPLxqwtWLWpHpO/G/Y5w==@lists.infradead.org
X-Gm-Message-State: AFq9FYIZZpIyjCqU1r+4CUoMxQWRKHmF+CD2gFfNTLUcMWKXQ8p1kF7h
	9NtOAXS4RKGYcDPKa8S1uI4sUhGx+hKH5bgKFVIdNMcll468MFZR2eoH
X-Gm-Gg: AYBFou0PDTkpJ4HQZmuQe/0xa3RTuPAB1j+Cd6rn6c5hVSpss8WGIJFEDjDIzGvueZ4
	oRgjuLyaXqKjnGeHThIP9jRdY47PiqNwBsMwU51Wa3KhquPvwuPX0JL1qD2+Hy8pJJP6XfPgPdS
	JU2Y+n62ITLzRaC9U3DVyThmryvQx/p9u/mepUzcJoPQf4ndGLznxT5H/9WUDn0car24yawxeZC
	GceGZNrgodN4lP3ibe4qB3vR+WmkYPw4W4JsODXrNNvsOG2ZUt6RGmi7L53o9y42x+JjmlBx2Vc
	cnlabxw9b219QRB/UQ2hCQ82QML2jVe5oECz2Wp7tCoyn1JKo6KDAee4lhSKhslZHM+lOZ0eGYL
	tFb0uUZJr2kHOAXDsT9IJw9R7eKe7HqdiAhAr7VX6ic09yD44HYaYM4TUZQAJmJtU6p0vUboDRp
	n9zaHxv5PPbnzPjeaBQS6+xxxileBj//4+O0u78rHW5mxAET7FRP8GnK1o7UvGx+LX7A==
X-Received: by 2002:a05:690e:13c9:b0:673:7f0e:a8cb with SMTP id 956f58d0204a3-6737f0eaf3fmr5413546d50.44.1790694168952;
        Tue, 29 Sep 2026 08:02:48 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-675b7702a45sm83523d50.17.2026.09.29.08.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:02:47 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 29 Sep 2026 10:02:39 -0500
Subject: [PATCH RESEND] usb: mtu3: fix system suspend in gadget mode after
 soft disconnect
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-v1-1-a0ac3b6b2b62@gmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Fei Shao <fshao@chromium.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790694166; l=3537;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=42nYDcBAxNvHgQbbkGEcmz3UGXdz42wPE9jsdKzwvQo=;
 b=YbK3YF9A+aOB+Hm/xh8seZ0DcpGlIq2W0mafFoTLR2ixWJCnN6pznBz15u5t2oiwnrPpwG3qt
 SbDI0QLbGgzCeZQpKyx1EqiIMShHI0oFXGn17wHB/0m8DdbmGIZwk4a
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_080251_432351_66A4FE6C 
X-CRM114-Status: GOOD (  18.97  )
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
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


