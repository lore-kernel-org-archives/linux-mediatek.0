Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204F1CD1288
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 10:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29vu8g3Ed8C/yF1nmFK3k19phtXsbXUcMNAwp+Go5XI=; b=ismwQUsFUjZnGtRWzxysTswkT6
	bW5a15GBgkYn+He5N5QRCwfZV++bIHBoMCuowlOEoSBI1V8hyCgv+jDcvaWH707EKcsyy9cVIBxD+
	UQdb7asXL9r6rg1Z5o0JpfDO1WTgqbPorxrceI6e8/EpQdendT2rYD1EIp6cfCEqAYH4O+vql5Uma
	vdzkC6oS6UakOpXn8ezkiirV1yIBcUGrejtCygdXECSibtvUebVmWhGgZZjlGJTozIGfenoB0/7AJ
	8ahbbhM98S1Y4clJmH+xG9E9MvV+CL8nEzwVV3aqa4m6LLqE5eR9Rz38GwI0/LDNWJEp38XznC/Yx
	ExjcSorw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxtz-0000000FWi0-2jBo;
	Wed, 03 Apr 2024 10:31:31 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxtq-0000000FWc2-3wGq;
	Wed, 03 Apr 2024 10:31:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712140278;
	bh=etU0Fj2iZdIff3gebOm2cSSWKbsxCIRWcO8xXg0dock=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZFkQnSQz5Qh2ySG1S7JtHOmJ561+j+A92qPRyCSztA3w8ZfhQRv0ASmmJvEJoP9Nz
	 kcPJ17CUuClzRp8ZfxyufvRvYNR9cYv2z6MhLQr6Kya8sa2PekDKS8EdSKf+DPhae3
	 ApQ85hx42I+YkmItiy5Q3syOT74ijQGHAC1VQPEI2jmR3aHe9hRvWEhdcqjIofu3Zi
	 mNlpcLY5lX4OWjulIH3xql6G4N1dnSd4ldwFc+EhK7yHeSPCOQ/t3+Qt5slbnFxVlO
	 irbngHphEHkdSHf42d6/PD2aQnxs3FRkfY9+jWVeEStCIjOqBbzCufSq8OeGQE75QV
	 qOoeYBTV7dk1w==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C039B3780624;
	Wed,  3 Apr 2024 10:31:17 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	"Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
	"Nancy.Lin" <nancy.lin@mediatek.com>,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/4] arm64: dts: mediatek: Add missing gce-client-reg properties to mt8192 and mt8195
Date: Wed,  3 Apr 2024 12:30:55 +0200
Message-ID: <171213179799.60933.17952427266637004148.b4-ty@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240229-gce-client-reg-add-missing-mt8192-95-v1-0-b12c233a8a33@collabora.com>
References: <20240229-gce-client-reg-add-missing-mt8192-95-v1-0-b12c233a8a33@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_033123_197566_46AECD35 
X-CRM114-Status: GOOD (  10.76  )
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

On Thu, 29 Feb 2024 14:44:27 -0500, Nícolas F. R. A. Prado wrote:
> This series adds the gce-client-reg properties to the nodes where it was
> missing in order to avoid "error -2 can't parse gce-client-reg property"
> errors and possibly improve the performance. The separation of the
> commits was done in order for each one to have a single Fixes tag and
> therefore be more easily backported.
> 
> 
> [...]

Applied to v6.9-fixes/dts64, thanks!

[1/4] arm64: dts: mediatek: mt8192: Add missing gce-client-reg to mutex
      commit: 00bcc8810d9dd69d3899a4189e2f3964f263a600
[2/4] arm64: dts: mediatek: mt8195: Add missing gce-client-reg to vpp/vdosys
      commit: 96b0c1528ef41fe754f5d1378b1db6c098a2e33f
[3/4] arm64: dts: mediatek: mt8195: Add missing gce-client-reg to mutex
      commit: 3b129949184a1251e6a42db714f6d68b75fabedd
[4/4] arm64: dts: mediatek: mt8195: Add missing gce-client-reg to mutex1
      commit: 58f126296c3c52d02bf3fad1f68c331d718c4a9b

Cheers,
Angelo


