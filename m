Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47514C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 12:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0x9htRSO0NLNUb0aQsPU3PIIPLwOcwvZqjmibRcaXos=; b=B9bvmYNX5jE32kqv3KybPX3KYS
	3b73vSt4VhuCCxLTdhCj/q+/9szo5MBEMvF2NNH309aCZNT8TaXq5WJ5iG3bP8qf3RFjX4doOo1MC
	xfXDMLOpwBNoAdUW6Fu1460rf9ya0Lwy2CRMMqmv5Xbs1eby5kgIq9MkZMG/eNNsPR9YC2NmwAlb5
	tTcxOAGfTF7aZALINS/3eqF7njIDnBFOlMNSRMnI45g1Dt8AJtR+a7jAjHwlVqqErAGisE7f637s9
	i+oUlDVPRR+iEjckXRjHPgYwHz9VyuHGa6YreY2oVz5QD5cCOJS+j0Xbt29Ox+oy3A5VydM10J1K/
	vR3gC0QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETXt-00000002L1p-3qSZ;
	Tue, 04 Jun 2024 12:45:45 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETXq-00000002L0R-3cYb;
	Tue, 04 Jun 2024 12:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717505141;
	bh=ojfNzIBBbgrqBeuKRr8YSDJc2OO06w8xhq1YsaHW3so=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=wNYI8J1EYr7CjgxQW69jcDJVLr1ZvE3wixnGaGWykao2gshPD0ZFLywPgYx5NWSia
	 H/9YKnVDVoP/i3LdAOIzHOgKA/GsIG+iK9HNslhf7zv+3qD37BeinD1hOPlpiJP2r+
	 h1M3Or22pRu3EMF6bVO9nRJtj27RuAGSAgbUQvAKkDvH9e0zS5P5o767D/En0hb1x+
	 8gSLym7vtHaqDEOCyRA2awta8Uo5u0Dl0XnmIbQAtRtizErtsikHySM4yfMR3aH7J4
	 21qBomjmAzKZLwqW0X9v3QQexMJuMKntI/NspLlB2wB5qVLxfX7UPD8kdTvo8kZcPm
	 mPUSra+h7viUA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A8FA637821A8;
	Tue,  4 Jun 2024 12:45:40 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
In-Reply-To: <20240604063159.29216-1-zajec5@gmail.com>
References: <20240604063159.29216-1-zajec5@gmail.com>
Subject: Re: [PATCH V2] arm64: dts: mediatek: mt7981: add I2C controller
Message-Id: <171750514061.334947.2592643629827567886.b4-ty@collabora.com>
Date: Tue, 04 Jun 2024 14:45:40 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_054543_204823_31D38CEE 
X-CRM114-Status: UNSURE (   5.52  )
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

On Tue, 04 Jun 2024 08:31:59 +0200, Rafał Miłecki wrote:
> MT7981 has one on-SoC I2C controller that differs from recent Mediatek
> blocks by having a different SLAVE_ADDR register offset (thus a custom
> binding compatible string).
> 
> 

Applied to v6.10-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt7981: add I2C controller
      commit: 85ccbe8afbb4d4744f4f3a1519c5a59a8b74c87d

Cheers,
Angelo



