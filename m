Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFF4EB64D9
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 12:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aki8YNbvh30Nl8pX9xiOk388ddaYLT9xHkDQwZcUgns=; b=QsEZ8fSdRVO89KxzQ+kBYUMm8j
	w0MyZAOFWQwCSoyIZdQHJ6ve99WN5hsHm4VUg4Q3zUKUAap7LBVHkwkkjb9b7aNcgtQEJQICKGHjz
	HXl2GS4YK9nEZDr03FWFVFOYRxLFQ2QlX5RQwl5L+0M55H4p7dUyf0URHHXRySthgOkniepgHWFDD
	RR4LQ00+/ivIrkH+TT2CytkZ5nvGYoA0aEBDKHzjLBGDkd05hOntFEUyQELrwZn4ZTyIwMlg5GV0D
	kyPH+77O9KUt7fV8Lf07/gLOn1+vKrw3QLgTsRUx0a0m21b1kby3JGocpdVT2eIEXAfZ+agxdIMpQ
	DGonnvng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGetX-00DCz7-1d;
	Tue, 04 Jul 2023 12:12:35 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGetU-00DCvk-1A;
	Tue, 04 Jul 2023 12:12:33 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4E1F96606FA2;
	Tue,  4 Jul 2023 13:12:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688472751;
	bh=P1P/9q4onpwMjyiQG602hRaoNrRzXoH8b1X945zhtAM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C71tfIEusVtlX580C9ELSJo8phI4SpDiLr9nkMgjg4EkdvbYzzBh8klrCoLl5JDpY
	 svONfH40auZA1XiNp9K+IP+NV0coCIXseuXVSbeOWjKTq4IGVDwr+k65QuuGBDxmvf
	 CK1+240ofHdU1xgMH5sRoNTjBGjWfhkkxOwwyqfoc+wS7JJVKtf0zCSW1/G24ABcI3
	 9TLXfMd9tTxIKj0lgLUdbROadDCabJF0GModd/MmmWnzwAFmcDcQvNqCCoWmti75bM
	 l8Zj1z7hbP5QWM2L3jB3Uag0qx7G4AWyIRy2dt7K7hiM0eR7EW+T1QQ3Y0jB6k/r0B
	 Z54vFg4q5c3OA==
Message-ID: <6f5ac0a3-51dd-184b-c116-def6d7d853c4@collabora.com>
Date: Tue, 4 Jul 2023 14:12:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5,02/11] media: mediatek: vcodec: align fw interface
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230704111327.7140-1-yunfei.dong@mediatek.com>
 <20230704111327.7140-3-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230704111327.7140-3-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_051232_546889_9A977E4B 
X-CRM114-Status: UNSURE (   7.46  )
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

Il 04/07/23 13:13, Yunfei Dong ha scritto:
> Align scp and vpu firmware interface, remove the depedency for
> 'struct mtk_vcodec_dev' and 'struct mtk_vcodec_ctx'. It will be
> much easier to separate video encoder and decoder.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



