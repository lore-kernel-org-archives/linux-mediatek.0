Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A01CE7AE6
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Sep 2024 08:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FEO4jb3OdXofRAIPxzn7VIfujzT1rq+Fj8VGMgiPA8=; b=m2eyEWRoHp71Uy714BzbtTz0cE
	aWzK9ObD4qzQ4GlNZymT8UMTAIljxutsDA74jnTdvD7alIP3ih5hBglQH8zqIEVZfM/Y6dFWmt4dc
	HvBRd5qKoGvLokJXnhclCOKBBl6MpWeZBPQonpd3RK+EZ5+aLxIP0y52iLxtsGbYqPBAyeaMyAk0k
	JMMnm7KNLEBEEOZ5x87ICpLcbHmA1978+xNPYsjq820NpBnUpmtPq9EYLHFc4EQhjZH6fH1HAYT8e
	xm6rxb1Le5irrRXCeiazBCbxr0bZWXErxe8bSmxCe8SBmxhPQ4OQklkctYlh6/+Zp+OrjvxewhYPf
	XPxw5W3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smUGC-0000000BIMm-1hJf;
	Fri, 06 Sep 2024 08:24:04 +0000
Received: from a7-33.smtp-out.eu-west-1.amazonses.com ([54.240.7.33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smU8D-0000000BGFj-16AS;
	Fri, 06 Sep 2024 08:15:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725610545;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=yM3jGEYrmpmAPT0rz7opuwruNthFWSkw9+TDL4YVBDA=;
	b=aSU5dIMIVZa+cVJ8YC9WRBz0bUv9ZRkWK5nvrqULiski3hj0PrU0tO8GE0DE5tDo
	tJYkolI1oPcFUfhre3qb8194/JecXFEhraqDF6BGAvjeLDCEN5BkjskujGkw787lkOT
	JhRTqG+8JEPJbuXqi8WS0M4KPo3oeYmR2FNm7ITIAyt6v/4rjAtGbEMhA3nF/r/aSvi
	cvJF3ozvVIhef+8lnEZd7mQykkA6R5favg/l1EJL46lVMIoLa/YccaPcYzHbhSY3ncG
	Si6+iKezpPy5tKLOBX5ZsfXB8Y29Xx+BGuNwtu2ZKwyN4h72SZWyU5Lu12NHxsRBeNj
	qmH0hFNeMQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725610545;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=yM3jGEYrmpmAPT0rz7opuwruNthFWSkw9+TDL4YVBDA=;
	b=ceBrJR0YS4QJudMIU1bumx8QW4TjyLwKO/B5IlDefuyExI/7A3gSeecXmcnWI0xG
	IIa1I1+32mFPri3a5FyfqIv201Os4uSGsCSfe0+dXcZR3SV4XhjNg8yiKis28mT1GrA
	LNjnn7XFJjm6ktDTZhX3qWys+vrNabuz4qn9mLEc=
Message-ID: <01020191c6674f69-5391f772-bfad-44bd-884e-c3ce732c19b5-000000@eu-west-1.amazonses.com>
Date: Fri, 6 Sep 2024 08:15:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] media: platform: mtk-mdp3: Use cmdq_pkt_create()
 and cmdq_pkt_destroy()
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Moudy Ho <moudy.ho@mediatek.com>, 
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20240901143259.16849-1-chunkuang.hu@kernel.org>
 <20240901143259.16849-3-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240901143259.16849-3-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.06-54.240.7.33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_011549_510764_AD2BD645 
X-CRM114-Status: UNSURE (   4.39  )
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

Il 01/09/24 16:32, Chun-Kuang Hu ha scritto:
> Use cmdq_pkt_create() and cmdq_pkt_destroy() common function
> instead of implementing mdp3 version.
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


