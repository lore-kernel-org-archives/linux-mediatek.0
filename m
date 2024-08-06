Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE2CC3DA64
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Aug 2024 08:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSU/7Kz+oEIpxKjEzwo61RqKAafjCLDSroZXQNzm+mM=; b=UdR7d2ggsACV+xgtVjR5yoBquI
	FwcE2fD+PkUQnaQ5Sh1sloszPNyGQOljAtzyESAjVAFU1OhrJUiFUYkK2pNVEZHgeEcDlOmcbgVkz
	22dpezNljlIU3OL8QxEUJXqL3aVg2E95dtgW6ILQBD4wjwVN5AC+W/9GSpsYhUAmyoQgTCZTt5G+y
	zj1Iwh2/FSfxOXRNBR1XOL6Li9UOilmgxfRlNzpL9cvtA65TYsL3TMkfTJvoZR1f4gpJ8L23g7X3g
	Qmn+w8xGzBy5nfO65Cg/G/Ucum+MwdOR5HIkTZzKqfnZQjI3xeHTrjSyG8Wa2iycW8oW1D5NgbDIq
	C8D/k9JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbFFa-00000000tGb-2OsI;
	Tue, 06 Aug 2024 08:08:58 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbFEK-00000000swA-0d7e;
	Tue, 06 Aug 2024 08:07:41 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1722931658; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=N2e1lk4kfrhaRAtgWbQXJRPDt1ynW5cjnde2J8ZysRQJUAOwqDdoiAdewFHCWjNhJEocwUPao313kYJ+Mmi56n3OPAy5jHX1WiBXpc4H8lT9L3hSxbESAjQB1ZVCknPQ5lpKNtivDR9p6qfTxgB15jq5iSb1VXgz2xGzAng372E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1722931658; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bSU/7Kz+oEIpxKjEzwo61RqKAafjCLDSroZXQNzm+mM=; 
	b=PtzAXx+xwWGfy8n8MXnAcQHgDt+/Ap8wp5OOgQVXQBp4DlWEhu+pBRAd4D30EJzq0/mzh351q0k7OoA19WMEtHM4qaa5IrM+gr0ioP3ztz1zY4jlKWMcOSEMrA5VvhyIgnEyuNQ2AjoDho41kUStlW2E4wggMYm8Uv3cavmH5+E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=angelogioacchino.delregno@collabora.com;
	dmarc=pass header.from=<angelogioacchino.delregno@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722931658;
	s=zohomail; d=collabora.com;
	i=angelogioacchino.delregno@collabora.com;
	h=From:From:To:To:Cc:Cc:In-Reply-To:References:Subject:Subject:Message-Id:Message-Id:Date:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=bSU/7Kz+oEIpxKjEzwo61RqKAafjCLDSroZXQNzm+mM=;
	b=UsxKHhmfa6m19Dx1Hg90C9Ui3kMtV+xHQlf+B9NCEbbPjLwn/Hb8h+FSbGhJCmmD
	lS6SFz+2HQ+g1PrVGoNc9rxjnLilWpB+/gwDmEzPPhCKPZABzE41E6mVHPZzO3Y1SwU
	FZonMjhtDqjUH0TowkmUi2SLJxiGf1UNZ4pdShak=
Received: by mx.zohomail.com with SMTPS id 1722931656834676.9532817394971;
	Tue, 6 Aug 2024 01:07:36 -0700 (PDT)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240625095441.3474194-1-wenst@chromium.org>
References: <20240625095441.3474194-1-wenst@chromium.org>
Subject: Re: [PATCH] arm64: dts: mt8183-kukui: clean up regulator tree
Message-Id: <172293165481.46149.12368879686778657908.b4-ty@collabora.com>
Date: Tue, 06 Aug 2024 10:07:34 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_010740_268993_37F65080 
X-CRM114-Status: UNSURE (   7.51  )
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

On Tue, 25 Jun 2024 17:54:38 +0800, Chen-Yu Tsai wrote:
> Some regulators in the kukui device tree are modeled incorrectly. Some
> are missing supplies and some switches are incorrectly modeled as
> voltage regulators. A pass-through was incorrectly modeled as a
> regulator.
> 
> Add supplies where missing, remove voltage constraints for "switches",
> and drop the "bl_pp5000" pass-through.
> 
> [...]

Applied to v6.11-next/dts64, thanks!

[1/1] arm64: dts: mt8183-kukui: clean up regulator tree
      commit: f5843dc83583d58e13e6851c70ad8371f036dc35

Cheers,
Angelo



