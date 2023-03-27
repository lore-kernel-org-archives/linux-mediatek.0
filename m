Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6AEC761A6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 08:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYD5WmDfDxXFTuHmhkAJj7d+410DS7ifTBNrA9xRF4M=; b=dH5fS+o8+9sQQoVE2Epx57IOpd
	Q0Y8VCYgqLn3a/RwoUcnr02GdD37Lzel+4/fMvZvIReOVX1YYkkqqZDlQhuLl4/L72ncpDv8ex3SI
	tLv1khZZbAZ9KbtngiC/oEddBql3fGea2sRRIXO/xfV93U0YOq/XqttfdDaSC36SVz6yXyCAU4hJm
	Vn+OsMcCfpC8iro6fr98XpkzBEmBi4HFaermYNKQw5EdM39sB7tPfZcbRKR6RdAceKe/TseX5vd0b
	mSyJ1jdI92IJJGwCMXKOAmpa5lH3/stXhv/VMKzZx8YBp+iU4iazo0sVgn4Bmwcn5rWOFhEGm/yWT
	2hy+WyWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgi3W-00ACdw-1Q;
	Mon, 27 Mar 2023 08:18:18 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgi3J-00ACYL-0k;
	Mon, 27 Mar 2023 08:18:06 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 69DAE6603086;
	Mon, 27 Mar 2023 09:18:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679905083;
	bh=fXyGQD7JzRsVcp75uqtKIGddkq/mM05BxGvwpn9tP4E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mwaqnzlBYVIQlZs1XCn83AtESG8+YI1F0blXDhzjXg1a7ZNzA6NgbyfN6To9BMbT5
	 QYEfkq8gGwRj8mqLpR46AficszDyMqBM7V5QHeLBmrN5vqzO+HBNYVamwrgtQ8fzdm
	 rPrwZiP+u2QIrIdTfM6MRm3aKdMyAGdwgyOVw3ea0crsEGntS0WtA3wXvvPJG9N7BZ
	 88Xow/dw90jkXGIbttA/ujLao5mek1ZhtkEJDhd+UpWCZH60vTs8+lwRCurdXCQPMh
	 GKw0EYrtAL4h0TLaMSdKw/9iqgrX4W2Z/qolrM8j+JL9Kweb3LxuOVVF1QlE9omABo
	 uvIAsuks6Zm4A==
Message-ID: <65142d4e-8108-ebb7-e170-f6961265c54c@collabora.com>
Date: Mon, 27 Mar 2023 10:18:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3,1/7] media: mediatek: vcodec: Add debugfs interface to
 get debug information
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230327055315.13936-1-yunfei.dong@mediatek.com>
 <20230327055315.13936-2-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230327055315.13936-2-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_011805_395428_6A367D9E 
X-CRM114-Status: UNSURE (   8.09  )
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

Il 27/03/23 07:53, Yunfei Dong ha scritto:
> This will be useful when debugging specific issues related to kernel
> in running status.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



