Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBCED4A5E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 02:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L9EFgctOK7I61NwA7js08sNs8h4/HUg6GstBYjS/NkI=; b=q7MqHoZXlqE1FPOuH1xfJN09Lv
	x2bXcP3/YJziODLubQg/ChoKs2oSOk6jOlPvFbrNh/odZhBt3h9B9cl1uc1jkNffALw6c+GCZvMVj
	lRGraRBncoKB2ejQl+SGFwcC4j/6KRcU9m1vh1Yg4hqxqAgTRyHz2r5DVDcUePWQUugBFLiIvMn2V
	UdGGnSPX2CGsxULJOmn/z53Vyx6Q26te6BSR1iPc92PkT9DGWrMz95orVbODvqr0hM5P3aKyZuiPT
	PvDSJtki5qy7vVJ0MfA75I4qb5GDJkE30epQJTqrtXFhrjPx1uNA21U7SnQpA2rPw3KUNzlJ5QCa4
	Eg3KqkWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZRR-0000000DSrx-3OF4;
	Fri, 16 Jan 2026 02:20:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZRP-0000000DSqu-0rS7;
	Fri, 16 Jan 2026 02:20:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C76534353A;
	Fri, 16 Jan 2026 02:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FFD5C116D0;
	Fri, 16 Jan 2026 02:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768529998;
	bh=GCzrQ0j+1QSvMXWCusyN/aVUAD5+b87qrzjsqnsLW9U=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XA9GmcYwKmthDROkg5o4SXiniwfdMDVdKRqX0dpVVlOhLQGKb/R1hiPaFU0QEYqgl
	 sCHA/R7QRkZKRN5RRswx5y5MX9BEBFtVuZdifgDPgHSKrIsBjQHd+u+EgxaO/vZEZ4
	 5hr8lOg7XojqmZQCWtmnV4vWnXNm6ft5jm00yPi/dzNf4RogLHWi+7znAzz5XWaMXG
	 +vO1buEH1rqgQjJqolyIXJBHUFycnNZiOuwf0CsGD1/0mehSRAm9fV6GtdK+ZEMTAy
	 G7vdRjFAffWxy2JsSGwlelruZLJYbVcIizBZGnH4pShN/0cq1B9Z0JquHlZ+4QlI8e
	 il8AKQbNwbxoQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251024083247.25814-1-angelogioacchino.delregno@collabora.com>
References: <20251024083247.25814-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 0/5] SPMI: MediaTek: Add support for multi-bus
From: Stephen Boyd <sboyd@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, hsin-hsiung.wang@mediatek.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Thu, 15 Jan 2026 20:19:56 -0600
Message-ID: <176852999687.16445.9363555790881114587@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_181959_274058_59F8061B 
X-CRM114-Status: UNSURE (   9.43  )
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

Quoting AngeloGioacchino Del Regno (2025-10-24 03:32:42)
> Changes in v4:
>  - Refactored IRQ domain handling due to deprecation of function
>    irq_domain_add_tree() to use the new irq_domain_create_tree()
>  - Added .irq_eoi() callback for rcs_irq as that better reflects
>    the actual functionality of this interrupt controller (as its
>    SLV_x_y_EINT registers are really signaling "EOI", not "ACK")
>  - Fixed to use generic_handle_domain_irq_safe() to avoid races
>  - Tested again on MT8196 Chromebook
>=20
> Changes in v3:
>  - Added Fixes tag to commit 3, collected R-b tag from wenst
>=20
> Changes in v2:
>  - Fixed indentation error in dt-bindings
>=20
> This series adds basic support for multi-bus (multi-master) SPMI
> controllers, as found in the MediaTek MT8196 Chromebook SoC and
> the MediaTek MT6991 Dimensity 9400 Smartphone SoC, including RCS
> interrupt handling and per-bus registration.
>=20

Applied to spmi-next

