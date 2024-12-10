Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E94EE7717F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2024 08:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bu6Dh8g/0E/ueWgEUmTBaq/0EP/FmfN3hPySOszXQ+I=; b=jSd/o+0fR0J41qimkc5TpxXCtM
	kE1wbgMNSHKI/gk+RkXcxJR9EKQRn1M4yqjs0eBjq4aIYD0pN8zotJ9xmtm9OkNvfmboWjMwNmBqD
	5h7NUPgWEJPs5KhwiwcBmfG6YyZSBfUJ6CdLuLZCsCbZHVTbxgEyfJQxY6I+hqzh596F2JH6xETIe
	93iI3D3nnuzkdBwXJFSoQW6Ofbk1Ygn0S/DCo5wcqk+gfeJB61mrw7hb5UIPNezkhkdKunRH3x6a8
	dt1Ypy0dnjjHhgCnYuFxKTH27jMx/BDcO5VybQfSAnHHMax/ZiXxSAItl27mfERuUCPpIJTbJYopk
	NAdrKoug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvcY-0000000Ai78-168y;
	Tue, 10 Dec 2024 08:29:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvbT-0000000Ahou-2s6o;
	Tue, 10 Dec 2024 08:28:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733819302;
	bh=wpi0mz8gNIjqHdmS+cqPCqSRyC2hv/m/XJlr//FMAxQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LIjKKpWbbg+dvr3JuDxKmcaX+neuApyiRyU/uffcxMKwJWa8/thz8OE/q1sFrK9FJ
	 7jvHXVuZbfD+1ENQfSP9C/jkxQmFRXha+2vEi5ZjDTos9yjxc1D4ISd6VtvRLOtaKs
	 wSWbVtzy6CjNlwqtGUmSHIEcYBrtOfzT+2+X3277sBPkx34DV41+O7mvv8GhtFa/uQ
	 CvI4dyKmb1NczIVVMFPcMBgfZxiJX3nwnpTZk/ZgsRrg9ApxBNuxvoVdaIN5Y+bIys
	 RwFH3qo1HiU78UMi4IWIj1HXkkNhIebe2x6NrDYyuyTfj2W5sKlcRIi8f2znUa1bTn
	 oGyyb1UdfPrtg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CA79B17E14EF;
	Tue, 10 Dec 2024 09:28:21 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20241113-damu-v4-1-6911b69610dd@chromium.org>
References: <20241113-damu-v4-1-6911b69610dd@chromium.org>
Subject: Re: [PATCH RESEND v4] arm64: dts: mt8183: set DMIC one-wire mode
 on Damu
Message-Id: <173381930175.18469.11487989790886879423.b4-ty@collabora.com>
Date: Tue, 10 Dec 2024 09:28:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_002823_871237_3F528AA8 
X-CRM114-Status: UNSURE (   4.60  )
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

On Wed, 13 Nov 2024 16:16:53 +0800, Hsin-Te Yuan wrote:
> Sets DMIC one-wire mode on Damu.
> 
> 

Applied to v6.13-next/dts64, thanks!

[1/1] arm64: dts: mt8183: set DMIC one-wire mode on Damu
      commit: 6c379e8b984815fc8f876e4bc78c4d563f13ddae

Cheers,
Angelo



