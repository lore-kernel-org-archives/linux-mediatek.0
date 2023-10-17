Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBFCCDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 09:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCpGxA2jgHxwS1qM9YAZz2kkRRPPCV9Y+6kcNdrOQ8A=; b=Dez9/abuQ7QFq+JZNqKN/uCSw+
	QkMQJOErFyjdJd+4N6i+jt9BHGqRs0RbJW3i0jyHmNVIhrszq4EDfqqCkvAkL0bzWW1Ccx575t9SI
	YGR+9En0J3aSNzsrS/8fPZkmKdMk+qpZVzWThSwfKcqB8ZfhAglPltSMyliRyXLNQKWOb2IXMk9lz
	IMgJd2q/0Yzulou8QvmQbE+1PBKKOBBUwkM5GO+SfCgvMrhXZt/E9jtFpirObsP5uwZ6cZ3SJ/hcA
	VuG3KZR9p4E+gX6UJbH4I9Mkg1g2KTbt0nv7inUMnkb9W5M7uEgMlfPou+ktOhvoEB4VfcwU6q/rI
	oedZsy7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsgNr-00BpCw-2l;
	Tue, 17 Oct 2023 09:29:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsgNa-00Bowv-2l;
	Tue, 17 Oct 2023 09:28:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 397D8660708F;
	Tue, 17 Oct 2023 10:28:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697534923;
	bh=6HfwuNJuJmO4IH7PQ8TZLZYLci2FmLZx2TAZ4JDcPrQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TFsQYK32fz5whB4eeLKeYgadA1LZXu1CfKNn2bgZg1RdEXSX0/DaE8O7Phpbe2THP
	 gmDLKEpy4SpqRMGv16qVDpVMlc7KoYuwBGyyLvph3G5oBgDCFZxBv8iZJscP2PxdPb
	 IAytqxqlqeYNgIDvdgAaMowTWzn1YOXr7iBdfuDE+mE0rrAPePUQ//ewMGa71uUqM3
	 Q1oDlGMXiIash1CbIrHktXuii9oTbuzl9VGr1FQRKD0Tul7R35o5/2PY6lTJJx+yGO
	 oO+rpqnUwHMptKcZ+opGmat2/louar+B5isuyAcZXS4K14i6h9307l18bWlo/epFpE
	 /ynVLJfLYMMEA==
Message-ID: <07727ad7-bba0-4ab0-95ce-9ceb13395cdb@collabora.com>
Date: Tue, 17 Oct 2023 11:28:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] media: mediatek: vcodec: Getting the chip name of
 each platform
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
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
References: <20231016064346.31451-1-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231016064346.31451-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_022847_045452_51BBBF99 
X-CRM114-Status: UNSURE (   6.14  )
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

Il 16/10/23 08:43, Yunfei Dong ha scritto:
> Getting the chip name of each platform according to the device
> compatible to set different parameter.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



