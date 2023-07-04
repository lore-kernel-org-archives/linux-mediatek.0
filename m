Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E49AEB64DA
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 12:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXloMTQ55p3A8CKBe/GgsKuw6GbaliGICgRoeEM7uWs=; b=RskhZ2Sq2AXajXsK7UBzTXAFb7
	g3xaBAJX97FeN6GdrWxh88B2lDf89EQ5ZNaEkqjFg2XnoKraxQimuXFU54w4hlExck1hO4tj3bWkB
	OCTjMXan2re4ZyQ6RaoB7xKtfXWOjOm7Ea6xCDOkB4tvkUWNa+bv6FQXcTWST4ZRVra5C7a2VCORZ
	k8r95J9MIMUOt49l7/PVrq4WRBpuaG4aD/FLNuvmSQrdxNwcFsVTaWngiy7G1mS7K2mR6K4Bm3wzm
	nfAdHNKSzT+K8TTtAAJjpAAE7RKwGd5MEo0R5murWWW9/3Om4tXW1mbJijBF3rP0J62nqvdJ78X1g
	uIAbIcjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGetj-00DD7o-09;
	Tue, 04 Jul 2023 12:12:47 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGete-00DD3j-2k;
	Tue, 04 Jul 2023 12:12:44 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BEFAD6606FA2;
	Tue,  4 Jul 2023 13:12:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688472761;
	bh=K3r2sBozJg4yYZGmTnIxt/EJB7PG4I/zkHazGH3bQe0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WhtR1eVJWnyxcAreCrlkE/bhcISTYrGJV0M3VpSAFQy1lNub6lHVwbGtLxK6kMsgF
	 Tmi3FN7INFqr5mAI5Rl5coFZoram0SGIUUiRoCZqKVm3pCbHrvRRV7g+I0Xfzmg+3j
	 o55qaAkdWErtVKBy7q2nanquV82O/0WKKedpFCIKOyWEGxOdTDgBPIws2SJ5dGZcvG
	 hHwoG0zELGerXsDuHE2pGIqBbkapL0pdOHXDRx6Vbbck8bsRVDmWt/oZRDezYesQ2h
	 LHzdJQPu/R06EqE8fddYF8Yw6Ux8Rlh5sZFlXudsTVn6yYm1FoeJ3z2Om8131fHMxj
	 OyuHcEBJWp7ag==
Message-ID: <e223cee5-8f8b-c642-7d38-e59ea4e3ffaa@collabora.com>
Date: Tue, 4 Jul 2023 14:12:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5,04/11] media: mediatek: vcodec: Removing useless debug
 log
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
 <20230704111327.7140-5-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230704111327.7140-5-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_051243_023173_5216E516 
X-CRM114-Status: UNSURE (   7.20  )
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
> Removing unresonable and useless debug log enter and leave
> in order to simply the log message.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



