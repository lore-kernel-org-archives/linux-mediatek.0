Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C2EC3271E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jul 2024 19:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNv3CdsAy7qnE1vDIXu/jgdGKJhS4oc7HIXXOYD1i14=; b=gi+OGw3Uof26wCJOYVZuc0vOBl
	BsW2LyRjI7oTJ6Io/CDbLFZ2BpPgQ5Sx6ZUQ4chhoRzPkpz2LJ+RnfcZfPmLWVRDzmAruusOib1oq
	OPeu6wKAdfDY3/Tk/1UjH3OG6sHHUa7xjjuQumwNrS3rWqT2mirYlKOHFoVWFCxrn5h/fEr8vCB2f
	FnW3r+xmEEFwvuU1Ih5erqhLjZrV+SXyHForZakl+02zWH7olEBvV3eAORRCfdLTfnW7ovBxJkiOC
	Zi7S/cZPVM8fS1Q4gpCOwE/qP3a01/g3zPUN71HFWNpnzxhTvjEsuDWSA8SarYS8hia85C/xgw9NR
	zoZLUhFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQtd0-00000004mIS-2tgn;
	Mon, 08 Jul 2024 19:02:22 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQtcj-00000004mEF-1Q1S;
	Mon, 08 Jul 2024 19:02:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A9992CE0EE4;
	Mon,  8 Jul 2024 19:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF4F0C116B1;
	Mon,  8 Jul 2024 19:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720465323;
	bh=zNv3CdsAy7qnE1vDIXu/jgdGKJhS4oc7HIXXOYD1i14=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=S56rDTsvxnKU7hnenU0RfZ6yBrZu1MiLkuj/HIuSoKmmEfa777Ht9t7yuBjdCx4rP
	 IXB4s0EmoFbxiHQeCdwfCe1seXuq7KoCCkbNTd0hnI/tGPTjvr8OmJYEf0TaS27fSh
	 x9PuhP0IkbJEaopUjYx8rgi+/UZpqn+hr9hrTape9fgilQbv2oeI3sqybxE9dVHB5D
	 cAdIzvkreDQJFoQ8ajU3cpUzuXQK36PnQG3d3XOrtMOFQ4y8gnRDi9p6GOu39qRM7x
	 +XYcumJhfJwOvDEoopzga59lOgu64Rlt/WFI5L7txvQ71C5URoPtSqaUPAN3ugJJhz
	 u3hdCrTPd5+aw==
Message-ID: <977bf1136272701662ca7bd8b0a38319.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240628105542.5456-2-ansuelsmth@gmail.com>
References: <20240628105542.5456-1-ansuelsmth@gmail.com> <20240628105542.5456-2-ansuelsmth@gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: clock: mediatek: add syscon compatible for mt7622 pciesys
From: Stephen Boyd <sboyd@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Christian Marangi <ansuelsmth@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Mon, 08 Jul 2024 12:02:00 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_120205_568924_7E0437F0 
X-CRM114-Status: UNSURE (   7.00  )
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

Quoting Christian Marangi (2024-06-28 03:55:41)
> Add required syscon compatible for mt7622 pciesys. This is required for
> SATA interface as the regs are shared.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---

Applied to clk-next

