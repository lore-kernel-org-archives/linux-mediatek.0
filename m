Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB05BE77188
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2024 16:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=48Z8KH2uegJaUIDDS+KrFldxl6QmnldV0gEosRN0jzI=; b=ZmIYVeqgA/lmOQZJjPLnqBMwRZ
	1wF1Dw/JIUBCP0Yn95QsDO3zQOfne2ub3efpqobldI9CC3D9UeTlKmTTUYyIlR1i+DZHOiOzDn4Ji
	DKD4BZ/klxrUJ9+A/CFoAPYWmv23f09x8ldcVNaRwuWuKgq342KCCZrdlV7gc/O5h4fPIJZKiPo1i
	RGSdHUlyWxUYtaY+yB6yfhs9AyQyiSA0mNf9CAQmc/6enmBUM9F3b4bWjfFR5LOy/DsdM0wwnNXIF
	INI+xAhpdx9viGywh0ocshyK2SMBFYPlkLSm9ZhPVSr+G6sQJzMfpy0aaHceKvvp0BRw0yxV+jCsH
	9NOHm73A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgFZ-00000005WIy-42hJ;
	Fri, 20 Dec 2024 16:53:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgDI-00000005Vqc-2b68;
	Fri, 20 Dec 2024 16:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734713453;
	bh=rJlJwNSrvJNint2s4x6Bsh3r1gCb0KtVtqbAlksXxQk=;
	h=From:Date:Subject:To:Cc:From;
	b=MdMCo1uCKW5VA4kaeLlY9EjsIiFt9ppysFSoBCe3E3WMCg2HRKO3mZmB22SxBAaET
	 8U027Q8ehjycuQdc339pya0uYcLkHQGCleazglyWCDj4asMdC8YMPEmMD4Vuyad3h5
	 gOVw6w5Ul1b685oYE3otnW2XzSw+Lp6wfXNPBH3txcdvuSqpEE+yOjvgJckmrRSOHK
	 1caHTn2bAs0LL6Jsz1V96SsCiaoYlV0zUQw25ZIef3/H+aI2okdkU3T/2GSclMdahF
	 02miDygxZlr0TL3zI/gKQhN0UdBhBwtW153S/IeN+lauERB+Gp5prH1qkfgCeMRIpg
	 6C4F0hY8IAXOg==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1000])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3EA4D17E37C0;
	Fri, 20 Dec 2024 17:50:51 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 20 Dec 2024 13:50:44 -0300
Subject: [PATCH] arm64: defconfig: Enable MediaTek STAR Ethernet MAC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241220-mt8365-eth-config-v1-1-7f3ffae35fd6@collabora.com>
X-B4-Tracking: v=1; b=H4sIAGOgZWcC/x3MQQqAIBBA0avErBvIMcO6SrSIGm0WWWhEIN09a
 fkW/2dIHIUTDFWGyLckOUKBqitYtjl4RlmLgRpqFVGD+2V1Z5CvDZcjOPFImp1VbNZeWyjdGdn
 J8z/H6X0/KFs6tmMAAAA=
X-Change-ID: 20241220-mt8365-eth-config-23ef81e5d938
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_085056_820471_4F5AA833 
X-CRM114-Status: UNSURE (   6.58  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Enable CONFIG_NET_VENDOR_MEDIATEK and CONFIG_NET_MEDIATEK_STAR_EMAC in
the defconfig to allow usage of the Ethernet controller on the MT8365
SoC.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dfa5c8d5b65863741be7d7d3c6f6f05567d336da..0de2dcb5799f4b405fbfdfd9f2d0afdd053d0c07 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -360,6 +360,8 @@ CONFIG_IGBVF=y
 CONFIG_MVNETA=y
 CONFIG_MVPP2=y
 CONFIG_SKY2=y
+CONFIG_NET_VENDOR_MEDIATEK=y
+CONFIG_NET_MEDIATEK_STAR_EMAC=m
 CONFIG_MLX4_EN=m
 CONFIG_MLX5_CORE=m
 CONFIG_MLX5_CORE_EN=y

---
base-commit: e25c8d66f6786300b680866c0e0139981273feba
change-id: 20241220-mt8365-eth-config-23ef81e5d938

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


