Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205E6ECE57E
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 11:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nbnhbr8nrpD1gUuUUOlHRyg3aPZmo8Ogd3K+Td7vJ2I=; b=MDlxZ/VcQ1KpeVzRV0+PpT07rq
	v1VG+MnerD3pa62frmrkKJ77HOaErCXYLiGm0tCMoIijARQqh/mWwSSoh5M/uid+JKNHzvdI9Ucy6
	+EwvxVS5ac0n+f4gPwmrNZuK9ITCbfa10aSctWrNOwmFSAqstLBPiC1lL9FyZwEUN2dPf9uGuHAia
	wI8OUl3TtYrGEjSgB1LKiwBRaw3rOiIDAWmWEny/WM0qjNS8fDce3rDqXnJd3ONnan0nelgxkMBPW
	MyujKE++iZViFfBXamSwtEjH9bJA8/rDFVG5ELxCv1b90vBYMF3tSiUEKBBDNulwACpH/0juPaRm/
	y/qCAv2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncoB-00000001izh-3IQG;
	Mon, 09 Sep 2024 11:43:51 +0000
Received: from a7-32.smtp-out.eu-west-1.amazonses.com ([54.240.7.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncmO-00000001ilj-333Q;
	Mon, 09 Sep 2024 11:43:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725882117;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Ml/mIm3gRIw15q1Itl7+m1Kixv7uWMwrk1Hqf7EoDrY=;
	b=Sota0Eil7m42EC7RtPEQwmpjOCaZ6CKqZYH+nBc97vO0VmV+bfWFjJO5E9KiIICs
	5NCxSQZ5oFQIfdsVM0UimOiaKh9xdVnGS4CF2YX0kymfipW38FjF5LCVybahhn9iZYl
	CC/gs8qq2bJXvIFGaaSWXmIup+kOaGh2otuKK7UH1Sa8LBZ6KiS+blVQIsHL31KmflO
	eu1QqM1oTOdjrBJzA41VD/RN6uOyWXUetA/3ZOUa03QBAtXXHshXuZiJLizskVNtAVe
	IMdRqKbBhIjNCdHMT5XtRyAwv57cpd8DrsQgWjOarqf8uIWFM8eBcirDtJWegBZ81nL
	ba8N0rhBxQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725882117;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=Ml/mIm3gRIw15q1Itl7+m1Kixv7uWMwrk1Hqf7EoDrY=;
	b=Lc5n2ByvwtE5MiE5EKUoQ9N30WZvSXPIe30t+n61DTwPnjzntm2bW38BXgW6mE9s
	/Qjb07PlLf2AuPNVydu4J2fpsw1FTiWNu/SjHVskaDfmm2hEyT/MoqpaC0SMDH2TGs4
	YetkHxM+2iJsUpstSPIwMQYFY4BMk5uQmKAmnGoA=
Message-ID: <01020191d6972b34-b6f0e6f8-bc74-4360-ba9e-d934b2baac16-000000@eu-west-1.amazonses.com>
Date: Mon, 9 Sep 2024 11:41:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: mt8183: kukui: Fix the address of eeprom
 at i2c4
To: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	Enric Balletbo i Serra <eballetbo@kernel.org>, 
	Ben Ho <Ben.Ho@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Nicolas Boichat <drinkcat@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240909-eeprom-v1-0-1ed2bc5064f4@chromium.org>
 <20240909-eeprom-v1-2-1ed2bc5064f4@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240909-eeprom-v1-2-1ed2bc5064f4@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.09-54.240.7.32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_044200_988456_2295E0ED 
X-CRM114-Status: UNSURE (   6.12  )
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

Il 09/09/24 10:33, Hsin-Te Yuan ha scritto:
> The address of eeprom should be 50.
> 
> Fixes: ff33d889567e ("arm64: dts: mt8183: Add kukui kodama board")
> Fixes: d1eaf77f2c66 ("arm64: dts: mt8183: Add kukui kakadu board")
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



