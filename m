Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06A6606A323
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 18:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gg9kNZxM;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XS36D8Zu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tFzDEYw+EnooXYdZM/QgeJxwD9oyUj/5EK6tkUOx56g=; b=Gg9kNZxMquNLCF
	GK7NqukmLZCDyU2FVL5n6adLGQEVQDU7sA17ss9YbbrXBJqc9hHiPIqaYrwadb37VtUm9FdvZ1hnh
	CBrI41J4K2Y5Jjotj80B5k+oy2PpKbIlRSeFYhV60DDoZosw4o6xJCm0WySrk6b6olKB6/3i+b+vX
	SI+Jdl1HxmsMHtq6jE6iRJnKGrSE2+ivdt6dB4fd/8k5hRyIenmldbnz6AJNjPwjuVd4z9uwPYn67
	vt7xiqli/QIcePTgFJDYvMENIVJD6tC72rhKPxp/cfHJlW92oZSuPIBIjhEC4OSKOBOhxFhuhu6xD
	IMjw+Byf+1Pj/UKZBHBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1j3-00000003dLL-1Rhz;
	Mon, 16 Nov 2026 18:46:45 +0000
Received: from mail-oi2-x0b.google.com ([2607:f8b0:4864:32::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1iz-00000003dIo-0dka
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 18:46:44 +0000
Received: by mail-oi2-x0b.google.com with SMTP id 5614622812f47-51cddc2451aso1328849b6e.0
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 10:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794854800; x=1795459600; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tFzDEYw+EnooXYdZM/QgeJxwD9oyUj/5EK6tkUOx56g=;
        b=XS36D8Zuif4S/SZQboEhUFPPr/opz3tIwvfJwXjdzoQ20qeR4UoTAGFcDOqrgdV2U1
         14Fv+21zQodXIRCk45XdUz45DZYWISnhho2DJNRTVm4VOJ4rIJHKAXoJ9pZY8dZNGHM/
         +VYgSy34LEjLLnpF+EfypK5ZN2g0QzLxnow+Qq7KvYd8LUs66SGwDs7VE9mfl2FZSfCL
         K1oHfYkVchbuXQinwT/ho4nWUmZKte4LsbOs05UkaGmziieYvAy6NxxWEy9KvMlN1u1y
         fate+pt2tgWEPcfLNtL39k5lI+fRyGMaDQjIvdR+yR33YJMj0pgzrSkZ0sMqmZnfHhLj
         elaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854800; x=1795459600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tFzDEYw+EnooXYdZM/QgeJxwD9oyUj/5EK6tkUOx56g=;
        b=T0JPcw3Vqj7RUfHYzKeY7vo1T8hfQM9CCj7ol4G1uG8jmiPZSizRFo+b6Fe0yQrRGj
         /bAAjyPffdGVRuhc57md38mw4URf100+Fun30mJZXaXMdTjAsQM92C+keXJua5MEDxqR
         eXt0oVBYwigF5h8ls+gdxNgc9ncb6QXGXZhZKQRGyQ7Q+yhl4S11c2zlPwUzwLZeUiL4
         bN3J4hiFxYZwiKElQ77EH1eWoYlYVOhOEfTBiVmqaqwRXY4qoOOw862kQDpz7mXJklwx
         sgx4AONDh+GZVMCHbZunuMsOmkdAwdQDIIF8XvXfzTeX/vfVJVFJ3CF6ihMaiI0/Q62G
         GMPQ==
X-Forwarded-Encrypted: i=1; AL+hErGsAMA7XuNYDop9nSh7hAw19Ihct3L8cgXnHMmI30lIB1f+IKCPu834RlnnkSfdrAxDbNcJ1Q91chUeyGIjcw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9baqoEOdQjS+1vgQa395V90q7dRf41QPQ6rotK9YO0io1TfjBr
	QPFFe8xTfR7Rg72y6gS2IlH75TQCDixWD037jMUMWefl4TRWci5yhDvI
X-Gm-Gg: AYBFou2N66dG+0RaL/JBA/5aJl8h2AGwhdbiiveMXDJxpxG587jIPV1jipfooOGCyCE
	3Rc35hX98Zu4NDCTn1kjQBGfwW6L+S3sqQ74/EhWeGyOndPZ429OkYqxoulzX/jgC7R9qNX9C72
	83wyrEidVB4PzqXXHiyHGF2TzjrdQnsAzbSclv35b7q8t7CRcOqgRnVvsdeNxIelv/UKqOYAjn4
	TBdcBL0gpeFloByzSMtn+PEHhs/kh20C5aC4cjEV0h4NGuzSYWbgA0fmLAZb1qnv6HmMUX//Ybu
	g/6KHmFsHhbZ58JPUP8Hc+nD2vka+KY2Rt/0SLTzrk8cMiHO65ZM9pzBMLYxAQUUiNtfexqfLc2
	vnK/JvFnRWUTK4cj+12GCKd4WNFhZlCbNFsAFyALofhPySeJffN3EufAGHEGjCCgAeSRGI8Aryf
	1ZPyVyjisELbGjVFtncieV8Xr09x32UKCHeVWmsC6AcMiVs7qtOUOYlp6Tc2gd+aR8+2+qXWNO0
	wkljfbSf01k97nH2a2VtdMiTK1d/A2CWjf8ETAAMm/QOK9oR7iDa7Vv6nQbfy/0KLTdCgtmAnKD
	ZsGilaKmEpmuXctsoQqEsIIFlzjNsYhwWDwvMdUq+CaP8xGwfu20Ck0pS7ErctVSGM1YjlcAlGK
	ZHpOxbZ+h5w56mmfSDzc=
X-Received: by 2002:a05:6808:4fd2:b0:4df:5cd0:89c1 with SMTP id 5614622812f47-56e63ba5727mr9976924b6e.23.1794854800435;
        Mon, 16 Nov 2026 10:46:40 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe242b670sm7210735fac.17.2026.11.16.10.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:46:39 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 16 Nov 2026 12:46:33 -0600
Subject: [PATCH v3 1/2] rtc: mt6397: rename the write trigger register
 offset
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-1-179145eb7e89@gmail.com>
References: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-0-179145eb7e89@gmail.com>
In-Reply-To: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-0-179145eb7e89@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794854794; l=1817;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=df32cdCXYqRXb7AgGz4g+i9owLPH2NyaDIX+9W0kTJ8=;
 b=YXj0OOXR/Ek7mAgVNZ2ePkshYGmwdQh66wpXgUVRUARhBWhlo4xL7c+hw4g+ulZz6PAARMwLB
 rVWKea1gZoeASnjj2zRQPwTaWnyl9lPPgcWMM+sqyHTCH5hZTlMhQwv
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_104643_276634_D8FD99C5 
X-CRM114-Status: GOOD (  13.76  )
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

struct mtk_rtc_data holds the offset of the register that commits RTC
writes, in a member called wrtgr after the register's datasheet name.
Call it write_trigger_reg, so that the next member, the control
register's offset, can be named the same way.

No functional change.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/rtc/rtc-mt6397.c       | 7 ++++---
 include/linux/mfd/mt6397/rtc.h | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index ab402f9f85c3..5afdb707a5b5 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -22,7 +22,8 @@ static int mtk_rtc_write_trigger(struct mt6397_rtc *rtc)
 	int ret;
 	u32 data;
 
-	ret = regmap_write(rtc->regmap, rtc->addr_base + rtc->data->wrtgr, 1);
+	ret = regmap_write(rtc->regmap,
+			   rtc->addr_base + rtc->data->write_trigger_reg, 1);
 	if (ret < 0)
 		return ret;
 
@@ -411,11 +412,11 @@ static SIMPLE_DEV_PM_OPS(mt6397_pm_ops, mt6397_rtc_suspend,
 			mt6397_rtc_resume);
 
 static const struct mtk_rtc_data mt6358_rtc_data = {
-	.wrtgr = RTC_WRTGR_MT6358,
+	.write_trigger_reg = RTC_WRTGR_MT6358,
 };
 
 static const struct mtk_rtc_data mt6397_rtc_data = {
-	.wrtgr = RTC_WRTGR_MT6397,
+	.write_trigger_reg = RTC_WRTGR_MT6397,
 };
 
 static const struct of_device_id mt6397_rtc_of_match[] = {
diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
index f4da579ec638..44d2b2cb1ff7 100644
--- a/include/linux/mfd/mt6397/rtc.h
+++ b/include/linux/mfd/mt6397/rtc.h
@@ -71,7 +71,7 @@
 #define MTK_RTC_POLL_TIMEOUT   (jiffies_to_usecs(HZ))
 
 struct mtk_rtc_data {
-	u32                     wrtgr;
+	u32                     write_trigger_reg;
 };
 
 struct mt6397_rtc {

-- 
2.56.0


