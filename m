Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D442C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 18:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5tCG0PCgpm5rqkO5qJrYz3YWsrGRktxZ3+TQEPwUak=; b=Ucy0WIDvC6OYZTIUq5xI6vnRii
	jZLR4fNkoSsMFBTX+sMiHaFZcWU5epGAnRsIoOALtACDQpXLiOwz4m+hrQ4Q4P23YrJ97Qx6APtfU
	AhNvRS+lAALhg+EAw5qXmMmmhkuIpdGd0P9ItaWkDQ7S5lGZkOV5nF/20EFyiGGIW99stBxYIsqnu
	QIzNtZEg3c+CgVUbTbNQ2K7nu+8RutvRwdpQrPfBYa52qQx/VX0qrnPcYzQbnjlhQ6ZZXIUwztrBp
	RwHq9b6wqJJyKI73p19kTDQFUN+z93E+lc0vm8vpgbAXr7cmNn9asSi/nMXd2fDGI1KzEy83uEk1r
	riwRDLsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojPti-00Feyj-NR; Fri, 14 Oct 2022 18:59:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojPtX-00Few9-ML; Fri, 14 Oct 2022 18:58:57 +0000
Received: from [IPV6:2804:431:c7c2:614d:1e72:1ebe:1da0:adb9] (unknown [IPv6:2804:431:c7c2:614d:1e72:1ebe:1da0:adb9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dwlsalmeida)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ADA086602374;
	Fri, 14 Oct 2022 19:58:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665773930;
	bh=w5tCG0PCgpm5rqkO5qJrYz3YWsrGRktxZ3+TQEPwUak=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UYu4GLSSuy4BnwFuENkS+CvxAS0BiLA5kCbW/jeORGNJ2/KjM1UVpfdHXC8b40lNn
	 TjLGqckcUc2dEgEmfMvllEfZAtgLY63//eeJRG99CtJWGa31ngkQBvSU2mAPckLrNX
	 B4AoWgTF0gnsliKBrAHIbgdZN6Znt1RIwWCppplk7WaCR4pjGxDjYB3Q7G9daa7OtO
	 ayAJUMQAqSaZfVXsR1qsyWa29+tPdbYZz6xGPLFO121z/BZZqC0gK1ALlgidiaXdEq
	 FbHL8iqbaN84MeXzeT64Y6Z1k03QnDLG/ROE9kaYf0OOPgEzfIKXTX0J4kEskJvOaF
	 k/WUnUxtFqJiw==
Message-ID: <de4738ec-5362-aa8c-1d4f-a08a4ab3cfc2@collabora.com>
Date: Fri, 14 Oct 2022 15:58:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [RFC PATCH v5] media: mediatek: vcodec: support stateless AV1
 decoder
Content-Language: en-US
To: Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
References: <20221001012915.8974-1-xiaoyong.lu@mediatek.com>
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20221001012915.8974-1-xiaoyong.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_115855_908616_43AC9542 
X-CRM114-Status: UNSURE (   6.52  )
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

Hi Xiaoyong!

I have tested this and arrived at the same Fluster score:

173/239 - AOM
11/13 - Chromium 8bit

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>

