Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076EDC7EE25
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 07:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3mXsBb2rX9ESzaq0KPYnXpEZIKq1PEDyUJJPX88OEk=; b=lccJV864CmGJpmmRwn9UoD3KTk
	8aaEBNw1uMaUYJoMD6tMfGM8tkR2QZ6MgLf/385hZop38Z/BKXJ2lwbKOV2MV2wYECI/kY6zRzjpQ
	NFrcwF+JMo4c7nZzeFJ7g1AiQY1NzySDCOj7XfjGAYsi7B/Vw0p0UxpwU4PoKjzDxeOztOM1fcit4
	3yb2+vBeH3ShQwz+F+YiZPCAWUF/fS7bKe5zh7BJq/lnP7IzK+nIDCrBgADXqwkASNPzNSVengGFo
	J8VBNGBAj8Nb2JRWOsQQK+Q8SVXIF8HzWlYdr/uEY1MXTErcdITWzt9kZ2jO0UvNBNPW+czZiG+/0
	ttG0YOCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7AA1-008Pm3-0J;
	Thu, 08 Jun 2023 07:34:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7A9x-008PiH-1Y;
	Thu, 08 Jun 2023 07:34:19 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0DFB56606F10;
	Thu,  8 Jun 2023 08:34:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686209650;
	bh=xJ+I3bcwd9Bg/yM7l1pEkI+rXFRK/dFMKrA5l7XRALw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=km6m0nsnZRM5AqYkLkmQK8jZf+krqDHQTD5jwbqzg9CEN8j1ZTkuIZpfO+jPNL9uI
	 xo6weoeh4iJWh/ox5PKnHfQd42Pny82ooWWQHeE2zzMO9hS6CTPPy9J3Xf70I6BHM7
	 fBHYrPnq2xWOZyv3IPJODjh3HfjT4NUnXI4MeYHsmn4PBX5YWq73BmtsV028Pj4zxK
	 HsMH+JGnVkVGSIfZBfOTsdZv+M9arh1g1hXPri3yEfF+tO/Xz86iJR4NqEnAP5wzKJ
	 KmxJBy1o5J3NlJmlqtMx5DSHAyG/X1tvAqDuM3j4BGM1K62w9I1X4lTsBetMNU9mRz
	 uLeWf4WG0lOQQ==
Message-ID: <b40de764-3673-fe5c-1eba-c17e63af55f5@collabora.com>
Date: Thu, 8 Jun 2023 09:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 3/5] media: mediatek: vcodec: Read HW active status
 from clock
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: kernel@collabora.com, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230607205714.510012-1-nfraprado@collabora.com>
 <20230607205714.510012-4-nfraprado@collabora.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230607205714.510012-4-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_003417_647952_255A69C0 
X-CRM114-Status: UNSURE (   7.96  )
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

Il 07/06/23 22:53, Nícolas F. R. A. Prado ha scritto:
> Remove the requirement of a VDEC_SYS reg iospace. To achieve that, rely
> on the "active" clock being passed through the DT, and read its status
> during IRQ handling to check whether the HW is active.
> 
> The old behavior is still present when reg-names aren't supplied, as to
> keep backward compatibility.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



