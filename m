Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61682CD5854
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jan 2026 11:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6A2f5pRKLLWCXsGktkZlq1xsZajq+qZGnEChNBYj1bk=; b=PahDb5WiY84Kpz
	cWBTcO2B083cH6vsNdFxvXqQntaq/+4l7tGcCZ5wsjnz1x4d8aPePvLCCao8dyqRuDqRRyo5hBmUo
	F/8aQW/fQ50WW3HBHHSIEnxdd8cIYtsF0LgSxZc+wKj/Lla0s+y83mH8R9hXR9s6HqkpDZZtTkyAI
	/KifDhxQ1BKZamvi/rnhJx8TnGeSLyM7UMlIADg0BenUMaWhCPcbuwv+quteEgcbPdFox7dD0y3Rl
	/UIFrEKebBKdXhRhl1N949aV0kwGwy5L04InobBOdoEIMFEpb+FkgDDiH5izKtiGvLg1nMpXAfplT
	k5+7Wv/lI4iHCYbaCkhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRTP-0000000EnEs-2qJd;
	Wed, 07 Jan 2026 11:13:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRTF-0000000En3Z-1RbB;
	Wed, 07 Jan 2026 11:13:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767784370;
	bh=NpznBBUs1p1Pi9cSELkptVrvzbeU/wyXKScPVQ4IH3Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OY3xygw57/hKPpm/n4FttZDKEm38ZfY4lU+P1hhBYDndEuuFUVZz81E798FcnklbM
	 XkPmiShY9Q42OV6GBLPDqmBKlj/okVAWld56mjOwkxfH/r6jb+mVsxfzbDXh2CezT8
	 1SB/dIqxF7V1ZUaMWQLpeLsC0/8nR9fmDniyerBMEpYm7NobZhcdfF63eglmwagMuF
	 tTMY+i3urU9eSAHvuA7RDd7pLJ72jUWez2bnf0wLoq3WzuGtsPMY0WrpsS8oybXczy
	 6bgM+tHW9hjM9w0oHmsBJxjJksoqpnleDX0sfY0y61pTcpDFUnUx6zEh0wBVnhXvGS
	 q1TmDVzz90Dyg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5A9B617E13F6;
	Wed,  7 Jan 2026 12:12:50 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Wunderlich <linux@fw-web.de>
In-Reply-To: <20251205215940.19287-1-linux@fw-web.de>
References: <20251205215940.19287-1-linux@fw-web.de>
Subject: Re: [PATCH] arm64: dts: mediatek: Apply mt8395-radxa DT overlay at
 build time
Message-Id: <176778437030.39195.12846683317432811759.b4-ty@collabora.com>
Date: Wed, 07 Jan 2026 12:12:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_031257_567573_3B15C529 
X-CRM114-Status: UNSURE (   7.33  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 05 Dec 2025 22:59:38 +0100, Frank Wunderlich wrote:
> It's a requirement that DT overlays be applied at build time in order to
> validate them as overlays are not validated on their own.
> 
> Add missing target for mt8395-radxa hd panel overlay.
> 
> 

Applied to v6.19-next/dts64, thanks!

[1/1] arm64: dts: mediatek: Apply mt8395-radxa DT overlay at build time
      commit: 34e7595912cfffdbca8c34d7c321d9937e0201ee

Cheers,
Angelo



