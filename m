Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D83C10DC1
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 13:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDT0KpJO8eN0DHmy1fOYdpJRDxGUcN8fIKIjBJ7ogRw=; b=3/R+8zsRJWnfsyDfSglG3NzT+n
	LW8qC2xHkA9YQ/vQ6WT1P1P70aeCC257JLusT79ITn4pFYmlNPYbUBAJ7YzJ6XDKxd2b9mp9mwaOZ
	mx/Xd0Cg1pz25mjZJ0/Rg3cUtTtFVbAA3qp2uaQDJTi7Gg5+06DOCVPKmpw+Whrk85nZjJOVOfEqo
	cODYWHpG5ATy8rFZ9VyPE1pI3iT5neCWI/QTUadYtALMGQC+Ks6yk2Psm/dcIAtvUToxEY91b3iiQ
	9DwetbZ5LG4UqUxJiBQLsZI4kZNb4lzNJpQS7FkXHPmhGz2zxKtPR2avmVmmz1NYa2OKJq5pk0M0f
	Yvh+EBaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8KcB-008SUn-2i;
	Wed, 29 Nov 2023 13:28:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Kc8-008STF-20;
	Wed, 29 Nov 2023 13:28:29 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 533C76602F2A;
	Wed, 29 Nov 2023 13:28:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701264507;
	bh=Rdu1NaKSj2kzBeybGne4kRQi1ROpMAaHqNT1VOxkkV0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JnvVyn4Lq9o5kVeK/OFctReEqNq9aOvb3z3dKUeB9dvDlSxL1sMAFEJA0QKwAMs4z
	 dP82xlCUWSV0vkDwZwqLmr1tdhXpvcWi7Hh8ivz0O4dTn2gJhGMzSVAqkDPGDIv33Q
	 zhytACMP9mlxNvUVGg04i8ADhiMXSIfmOvHRimc2SBA99ydxLJIvTmqVtofKpmblsf
	 pCvpHWbsKc6yOhZoplKBVozGhestOMNDPD8csqTz6g5j56enmA4358ibDrYguj43P/
	 +TNMSElGTp7r2yzlfp8PDbcqK3hTPt6jcVZ3B18z1+WXKitymG9Yuwc/OL+t/t/bcB
	 4OAkUNu9o3BQA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	Eugen Hristev <eugen.hristev@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	matthias.bgg@gmail.com,
	kernel@collabora.com
Subject: Re: [PATCH] arm64: dts: mediatek: mt7622: fix memory node warning check
Date: Wed, 29 Nov 2023 14:27:33 +0100
Message-ID: <170126437824.153055.16156664615192644481.b4-ty@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230814065042.4973-1-eugen.hristev@collabora.com>
References: <20230814065042.4973-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_052828_811918_FCF99D67 
X-CRM114-Status: UNSURE (   8.36  )
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


On Mon, 14 Aug 2023 09:50:42 +0300, Eugen Hristev wrote:
> dtbs_check throws a warning at the memory node:
> Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
> 
> fix by adding the address into the node name.
> 
> 

Applied, thanks!

[1/1] arm64: dts: mediatek: mt7622: fix memory node warning check
      commit: 022597b6e520b5c21894b9693bde215a5d788a17

Best regards,
-- 
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

