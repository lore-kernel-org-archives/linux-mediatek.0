Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4589BC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Dec 2022 08:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVJQ1gO+xd/MMP0l9akrdsDLU/mraKYy4po7qds/mlk=; b=vByPBBGCTWwviBJ1VGxS6ow/NY
	PYl6fWfYl1f62z5rzFGKQ3BdFeyIt1TtSMwGgmre/8pZJnckVoJiJB1dPfBmThrhwvZ62v4HW1F+I
	K6L2AniWZ8LKHCmMUZ4Yyhrf2L1H5Vi0dxR51rTT2sfZgHAKkQDmvb42titiAcF3WHQmrZpM5jnNM
	xyZ3sOTPwSEIxRMd+qcGS5Yl0bby+79KrlOzzcvsbC8tTGkyolRWlDP+BTL3zFaGJP2UnU16H+dEL
	gmhmnIlIbPY3do2/TsvjOOYmb8PLw99VQymp7LrsdMMLW28E+6ozNzwPIdJf5B8VF3aE10uRPhVgd
	dcXbjAxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4eWl-00AZuy-C3; Mon, 12 Dec 2022 08:51:11 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4eWZ-00AZd9-Hd; Mon, 12 Dec 2022 08:51:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5D80166016B4;
	Mon, 12 Dec 2022 08:50:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670835055;
	bh=+TCCovkk1aO9l4Twe3DVfO+F8Eil43Bb8teXw9Jn25Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kNTbRx/6pBe0MLj/3uqg2/HpIYonPNdnQclLvjOkSMixhW4qLpr0hb2xLhbF+vnVg
	 LWrdXNJf2x6yaLyCij61DZTIUMFk4gBgJXtrTwr6Dz2IcE8HvlpWlF+ykwz/5aTBpF
	 floxa8J9GF3sUWHRxIkdc0wcMuSXozbGOMAxzfFwSaVhjFvSfx+pP+Ah25gebsL3aU
	 T9upxykE5i1VentgJeX+8m11NrMKek+2Phv5UWCPyUq2CD4Oger40M9ppy1OyiAst7
	 pqzIMYakR7Ik/2u2/LNPFXCC2MUqeAFP3qQogF/e/DJB6pvarq/lleT1z06ZRfNcq7
	 QFA0twT9kH7Ew==
Message-ID: <2caaf016-c60d-3f4d-cfcc-e34a5629f359@collabora.com>
Date: Mon, 12 Dec 2022 09:50:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] ASoC: mediatek: mt8195: add sof be ops to check audio
 active
To: Curtis Malainey <cujomalainey@google.com>, YC Hung <yc.hung@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih
 <tzungbi@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>,
 "Nicolas F . R . A . Prado" <nfraprado@collabora.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Curtis Malainey <cujomalainey@chromium.org>,
 whalechang@google.com
References: <20221209031053.8444-1-yc.hung@mediatek.com>
 <CAOReqxh=27P7PogzhFr+37XBfRh5Nxu1x46JpdCH=ZRDVhRbeQ@mail.gmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAOReqxh=27P7PogzhFr+37XBfRh5Nxu1x46JpdCH=ZRDVhRbeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_005059_763011_F17F9B6F 
X-CRM114-Status: UNSURE (   8.90  )
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

Il 09/12/22 19:27, Curtis Malainey ha scritto:
> On Thu, Dec 8, 2022 at 7:11 PM YC Hung <yc.hung@mediatek.com> wrote:
>>
>> In MT8195 SOF design, both DSP and audio driver would access audio
>> registers. Before DSP accesses audio registers, audio power and clock
>> should be enabled. DSP will hang up if DSP access audio register but
>> audio power and clock are disabled. Therefore, we add audio pm runtime
>> active checking before accessing audio registers in SOF BE's callback
>> hw_params function to avoid this situation.
>>
>> Signed-off-by: YC Hung <yc.hung@mediatek.com>
> 
> Acked-by: Curtis Malainey <cujomalainey@chromium.org>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


