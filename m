Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF91CD3447
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 May 2026 17:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CllBL8xoJh4IglhZocsMiJYl6zMjGoSZL3uJ5PhEPoU=; b=W7AqDcF5jqOU2O4+jI+1MAYm54
	SWE6hIIx+i4ALtmZwR/4zBK3+bFEv6i5u5rM7PjbXdz0VWAA1g+WXYzgmzx7aIAhiDLs2PtW0fmTs
	XdHHmuU4K5vkDvHNrLKtVsxtgf8cbEY38j78zN8okxENxe5A7Nsn8aU7I1ahv6G5iuogvWPXQS1sK
	VGecyGe9tyMxvKIxhe+SXaZjbAyVQGCA8y+k+vr7LMC+OSkNcWNGKOOp92s12rA6oAu5cKp/pr/kv
	Qs44u1MQiSQNUnUKIzetsYxcg0ecKZPKNiSum/HX4rBXl6RMhinNA2fVSNLear5QRpyCbssFBshTB
	fZg7o6Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLltx-00000009NgP-2nbd;
	Sat, 09 May 2026 17:55:45 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLltv-00000009Nfc-0UJ5
	for linux-mediatek@lists.infradead.org;
	Sat, 09 May 2026 17:55:44 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3664df32e91so1549207a91.3
        for <linux-mediatek@lists.infradead.org>; Sat, 09 May 2026 10:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778349342; x=1778954142; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CllBL8xoJh4IglhZocsMiJYl6zMjGoSZL3uJ5PhEPoU=;
        b=J6A0pVaXEogiSS5qM1BYf3MjJD7vugIVnsBzJ06IX9g+uu0cCMMpzCnNv6d4ADFd0N
         4G027IEW8sh6qBIjgJsKaOagxfOGV0mmanZBjb3+oGyKvzpOqRZiCNwFcrH4Ts8HQeop
         vnMbJBPYEoIqRmn2d/l/lf9ajhbF8uqTrDS5YVE/lNYLZ+MrqtfqZWKkDeBhBKp/WNyY
         nGnt02li7WG9368jVMrGJa1F67ddBy8bFgBpKh9rxAFE5Ks6PX4YxB2E/0TgIMKSZWn6
         W4NAjqZWNEp9oChPKustgxY7dLDORIUY7PE8+GGwhYjunQdMwXYyttX/ULfw3S5YPZsq
         fmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778349342; x=1778954142;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CllBL8xoJh4IglhZocsMiJYl6zMjGoSZL3uJ5PhEPoU=;
        b=JjdTd1J6cKCM5APmd0I8sSL6C38SN+OkMvuoN/VEm/1ju1Y/sDvTnoCCdBbFuf9wcX
         c/04qB6nWfS2nfeLXeekkS2TXEAM2aavLDTX4nS8imlXd43ebaTTjCZXc39viMiLGgOF
         xx+NDBKuxG7mZEde2EN9A7yCYrL4TSyUU8yAUOIGdubiGvTkfsCVQ9PAjIJymFMMc9Md
         wXBe0SjJ1ycRVgcBD+IDWJ1EEy0O0ERZluReBZI8f4Dn8OMsdHyBcQw4r++GXe3YsigQ
         dy3f0ZoincnHwuI3gZXw4EoM/6LCPlYmyuETc7gMuTkTuP/Kp8ydrbvUI9iDc5aq0gUu
         wpXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zIdI5epL2Uw5mVLmbhOyH1vVX/VZdhqni6mL4c+SfBdlkqZanmkueekRTrhYo+7E0Co9gLbVSrfBkcPVO2g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrMHhiXeznz73XZJyfkyxMdAGjegNNpUNOoSkZjSPNxSa3aOkQ
	wXLuNXGBhlQTv1o/l4TNrzMVqsbinyn4xkgIWXkDGz4q34SCGPN0cQDO
X-Gm-Gg: Acq92OFUr5DNx2Mukgg/f63rA659OV1w0W4yELAN92LTWih886iw1OxrlH4vUYYRVVR
	u7IkIp9eRvH68lybMHH2AlJJl5me5z4E3h7zIR40gLu+4IlCwzSN+9hmAM1r+LUCngAmH7nvnYv
	rjGQX1Y1xirhxsHXMFwxwkWhFSiW5fFz/kRGis5zg3GfCGVE6G6V4mAAiQ050S+QNuhjnrMTHZu
	OwpGRVa4W+mNQsYfTaJs3abT6sE7IYNt6oQu9L31ifikZ84bT4AJYj3EuPCBVD7HRbdmHB8Nhiw
	YBGjnzPiUlCGnSoGBuVzt5i22ovx4ovmx55u13knM+32cUr6U55y4WFaj0T1BHwwTddIRHpqEuK
	PvTUqeLYv0GqxUHw4XBSLZRM2kLJbpRwgzVUK84iVY60mVLFtq1M6NzodLuiRjsYYEq9XqUmB5X
	MwGkkzpTobViBmI2FJrPhRw64W4QcSBDX9OAayx1AiTgS4GcFnTVtx4VR1bH49O06hVdfSkMbiO
	zxyFn+VE/3MHPPNROmrkkm6zFWjXQ==
X-Received: by 2002:a17:90b:54cb:b0:366:5c38:fd61 with SMTP id 98e67ed59e1d1-367d46cf57bmr3438337a91.12.1778349341817;
        Sat, 09 May 2026 10:55:41 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d627bc2bsm2657564a91.7.2026.05.09.10.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 10:55:41 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 10 May 2026 01:55:37 +0800
Subject: [PATCH] spi: mtk-snfi: Fix resource leak in
 mtk_snand_read_page_cache()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-snfi-v1-1-bc375cf1af8e@gmail.com>
X-B4-Tracking: v=1; b=H4sIABh1/2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwNL3eK8tEzdZIsUQ3MDU0NjSwtzJaDSgqLUtMwKsDHRsbW1AHZnNMF
 WAAAA
X-Change-ID: 20260509-snfi-c8d170513987
To: Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chuanhong Guo <gch981213@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778349338; l=1056;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=lzDchxhHtPBQa1sKrWzU7ln4zgtB68T8z64OOY1Zf9A=;
 b=HbtX3JjNE9/jOKrWHby/HPxknGm2rdz0M2k5cyqeMlF6IqYdlnAEwyswtC2+TX2xR1+vNf7Yo
 wpuwsjCInqSCHzzwBS1Zt/2GOyefeCnYKyuDCkLjSjM0FwxSIRKaC6r
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_105543_193761_F88D5C64 
X-CRM114-Status: GOOD (  11.39  )
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

When DMA read times out in mtk_snand_read_page_cache(), the original code
erroneously jumped to cleanup label which skips DMA unmapping and ECC
disable, causing a resource leak.

Fixes: 764f1b748164 ("spi: add driver for MTK SPI NAND Flash Interface")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-mtk-snfi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
index e616e6800e92..6e96e50fedad 100644
--- a/drivers/spi/spi-mtk-snfi.c
+++ b/drivers/spi/spi-mtk-snfi.c
@@ -961,7 +961,7 @@ static int mtk_snand_read_page_cache(struct mtk_snand *snf,
 		    &snf->op_done, usecs_to_jiffies(SNFI_POLL_INTERVAL))) {
 		dev_err(snf->dev, "DMA timed out for reading from cache.\n");
 		ret = -ETIMEDOUT;
-		goto cleanup;
+		goto cleanup2;
 	}
 
 	// Wait for BUS_SEC_CNTR returning expected value

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260509-snfi-c8d170513987

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


