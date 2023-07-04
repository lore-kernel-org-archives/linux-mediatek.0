Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89248EB64D9
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 12:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+7Y3tY5v3m/aBFDz4huQ5FF30Mz5pIQq5hqzTr6HMo=; b=SXRYbH7Nt/vnfiFlEe7LK4cghx
	Go2BUcjlGMhoxBa5eGTs/UmkafXi2DV4d7LCfSYYIz8PSt62mXx7n1UL13iAfhQtcVQq9BGIm6HuQ
	wNrkYXWqWU53HpMAGzoPKHsbdK9uiBQMuKKuVMDDPee5caelO6DEIzXOLcGH+zxc5TVUgRoyEeOEQ
	sBdA3z6CE4JJkNjhe1W+Y6U8xCKGpgXSByFx8cBEkSjRL7LzHw2aSF0qLLsmhJXz3bFoD8C/Yejbh
	1c3828w0bxpipYXro+ZoBbqKGOm6LL942k5t9qVP1prsclsJrnzU6WslLuZ9wIgSBDXpUoTGf9lgl
	TssEwxvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGetM-00DCqy-0n;
	Tue, 04 Jul 2023 12:12:24 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGetI-00DCnM-0q;
	Tue, 04 Jul 2023 12:12:21 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EE23F6606F8B;
	Tue,  4 Jul 2023 13:12:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688472736;
	bh=gtEEG7dRYJu0SiEKW5Wx1FDxVmqVMTNIuqomGX48dQ8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I1FCWP9j1zupzy6bk5gxZ04zFJgv2orKiLp7hkeJlC60ASvvdAuUoTJuSOKgDp1Go
	 YHDfqb+c9mJElae9q4m3SEvp2/u+o5pGOiwK9lWrwKaGBS/4nSD4SpotUhcNHdSVER
	 yEJLAsD1Mk9Of0srDT1JXrPPMPoxrmZgnyalr9XqzBGVrXW5BCsfcx0I1XN96jsEU2
	 eWC6pqrkmdIvlwITD4Cs8naFR4fnoGwKMFga0l1Uh5qWg2WFt05fhs4xVgmxHemq2A
	 YO7GfoKtEUomG/SWmXidVgvm6PpuD+XQO58A2NZKfXk0QR8GA9H3DjHtn6lZWL5nng
	 b9lYfQwtIaICw==
Message-ID: <0956128f-80e2-3934-c2b4-faf89c3bcb31@collabora.com>
Date: Tue, 4 Jul 2023 14:12:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5,11/11] media: mediatek: vcodec: separete decoder and
 encoder
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
 <20230704111327.7140-12-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230704111327.7140-12-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_051220_428038_D9715B76 
X-CRM114-Status: UNSURE (   7.21  )
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
> Move all decoder files to folder video-decoder.
> Move all encoder files to folder video-encoder.
> Move common files which shared for encoder and decoder to folder video-common.
> 
> Change include header files and Makefile to fix build error.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Few typos to fix:
s/separete/separate/g; s/video-common/common/g

after which

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


