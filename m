Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB37EE4995
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 11:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOQ0WKc8zJXVBmL054h4lD9ITwdwx8W3SRISBl0NPEE=; b=4mXCvGaLy+ppY6wkhcjuV7exGm
	KSgqgFp2P8HJAJfvYEZk28fgN8cESnG3jD5kOHswyOy+yM4Hh5V+Sdo5i1DukKR1+dovSyaTR+ZOu
	pyM2a5XBMW7+YRmPoGGd4uVNTbI/uLGbYEjotq8exfXmQVI7bBSwD/QMliylyA62jhGasNcG+ZDS0
	pbhnvxSrb/DLWk4bolB5flPEQknedv7h/wjXR6nb7BdbsNH6QnzZgR7rM9L4AYWBphyK7B6E6lxdS
	CTcLQxyJGLHT7M3iHpm2/RWf1bErKHs1LuilFC4Zt4lbAb5A7Gx5hFP0n6jpm4RDlDETMgsqDncJz
	wAIP5shw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLVS-00000009I0s-0rKz;
	Wed, 11 Sep 2024 11:27:30 +0000
Received: from a7-44.smtp-out.eu-west-1.amazonses.com ([54.240.7.44])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLSU-00000009HNk-1dnD;
	Wed, 11 Sep 2024 11:24:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726053862;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=KyJobcNk7xhzcp2Jb5bLfWvTg1sjvFWcmiu4ZNFOuNc=;
	b=iR6mZGTBY0ig9bkXxXUCoPXSzgzCP3ZA2MUdRS8/JLU4u/2qDAnPcDBwY76gR6oG
	5yyruaLCSifjRHqYdXX/HaSRLDblysbgYWdjm80D/A3e3r/aeH8lQ6jqjnrRjwEmVX/
	YBNcWY22m6BH8NmkgVw2wIraIC54EMN4B95lNbWjSRlLFo404CO+AGfX8V5EbKWQfUA
	JQcoXq1b3XcV8Y4AYRUPDpswpqBNzaE9eY6jh8OpNdZ5m602dTuS0bRTZ5ofsGSMoSE
	1NM8Z79fR/+ubP4nDneXAZoowsDaInmJwZzWYt0BQkLLtZKWp7iyEPd39cY3YhzNcjP
	fypbLg7aAg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726053862;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=KyJobcNk7xhzcp2Jb5bLfWvTg1sjvFWcmiu4ZNFOuNc=;
	b=NkS3Dxi5k6FOFcn1BGHTwIJyReKBKMV477myCbaDHAUjyxxBUCSjbcfyBwgqHh3Z
	gCtl9RItPdgFET2haQ2+HYHSCGKCQeRcIVMBaICZnJgkiwOeOx32HuaZdALehtrCaD8
	5M3I112HSpIPSSM+R6DqAdsgHNF/RQ/Oq8RQCyQQ=
Message-ID: <01020191e0d3cd23-55b96d22-80a9-4eca-bc01-f02e5c642544-000000@eu-west-1.amazonses.com>
Date: Wed, 11 Sep 2024 11:24:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] dt-bindings: spmi: spmi-mtk-pmif: Add compatible
 for MT8188
To: Fei Shao <fshao@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
References: <20240911105131.4094027-1-fshao@chromium.org>
 <20240911105131.4094027-2-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240911105131.4094027-2-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.11-54.240.7.44
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_042426_605107_80AE14D1 
X-CRM114-Status: UNSURE (   6.39  )
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

Il 11/09/24 12:51, Fei Shao ha scritto:
> Add compatible string for the SPMI block on MT8188 SoC, which is
> compatible with the one used on MT8195.
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.dleregno@collabora.com>



