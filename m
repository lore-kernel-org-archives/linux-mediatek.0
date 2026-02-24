Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D312BEFB7F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Feb 2026 09:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFc+Cmni7EjBhTXJbqFl5bJZUW2Dj+3CQVZv4wQar2c=; b=Vamc6gkHs6YeH5YIRzEf+K8VUb
	Ad0sFpUO/gfZRTWlcA7ZKqzObF2cfdMeBv8+MCBsuUHqz17Qxn6L6QdqfTxdaes6pwHP2vMODNVl2
	5jUOBrmT9f2i/y/qn9Mf26t/pPTVRpdGTZZzuLbfmzAcfe9XnIhp6LUApBJJQptaHf1d8E0OX9lrJ
	Ezuyj+P5OxqXuLx3FbMpq0SamoYFLJR77ZS+RtO4HXu8E9IT5lEVAhzXEAUfXlCKUFaBau5NoVizQ
	38ixMXint4g4D4ndoW452jgG1tLRVH/uf7QLFb9lki6wdVM2eb9NdBL8/4RR7uYiyA1qsGIRTHEvH
	yfYHN+mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoo1-00000001lW0-3n2H;
	Tue, 24 Feb 2026 09:34:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuonr-00000001lOl-2gk1;
	Tue, 24 Feb 2026 09:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771925640;
	bh=Rk0mKQOFUYNXGWNS8XtaMpYkrLQ5SVqdj/w+qNADrNE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KqNIZioUn3fn48jZd1UE17ATUd2Vb3t1CP9ZLFEPipm5lw8O14MJeFEY1AyJ2qzqD
	 b9azpjVjabLSU4dhZPzu7aP4KTZgWi+43VaixDerMtL+EdsPxxWra6zYm/gu7GciPf
	 DRkxENiGHrOWvW4uOOilTkRCCqbWte6Hwswg2RbzjeyrevoDCEq6VcchKl6GVP3/5T
	 Pf94maJQyzRnCoQfQr0qf418cyTiBjEBPC6zlen0TgGP3QxBPVJvruTo61SkTZ6a+u
	 tPBvFpXmp9zciM8BC6yAXQ5jkKlqQVCArg01AOPRqZx8iZL5AjpsnK2O7UulG4DNbz
	 7dRhbiKr1yJyQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C4B5717E0A2D;
	Tue, 24 Feb 2026 10:33:59 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260218-mtk-genio-mmc-aliases-v1-0-e218e9f771c5@collabora.com>
References: <20260218-mtk-genio-mmc-aliases-v1-0-e218e9f771c5@collabora.com>
Subject: Re: [PATCH 0/3] Add mmc aliases for Mediatek Genio boards
Message-Id: <177192563976.11826.17980398083963853310.b4-ty@collabora.com>
Date: Tue, 24 Feb 2026 10:33:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_013403_859150_C30998AA 
X-CRM114-Status: UNSURE (   8.10  )
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

On Wed, 18 Feb 2026 10:23:01 +0100, Louis-Alexis Eyraud wrote:
> This series adds mmc for the Mediatek Genio boards mmc aliases in the
> board devicetrees that do not have them, so that mmc host controllers
> get enumerated in a consistent order.
> 
> This series is based on linux-next next-20260217 tag.
> 
> 
> [...]

Applied to v7.0-next/dts64, thanks!

[1/3] arm64: dts: mediatek: mt8395-genio-common: add mmc aliases
      commit: addd3eaf5330d4b5bde930b89f7c7f3310dd9bf5
[2/3] arm64: dts: mediatek: mt8395-radxa-nio-12l: add mmc aliases
      commit: 4d580d122bb52efd4a7e5e93d61c066bb850c06f
[3/3] arm64: dts: mediatek: mt8365-evk: add mmc aliases
      commit: eaa699ee20847335d57216b4e0b779c762f544d8

Cheers,
Angelo



