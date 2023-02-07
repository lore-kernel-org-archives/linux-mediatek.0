Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E515C636CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 09:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1CenLy7PblHcSyvd+RHCJHE4WY1SS9rZYRcDuYKhoo=; b=QOxGSMFdDkiWfF4DQa5yXUn5qg
	Ogyg5gm04UR9wKIOQVaOkXUgDejD9vp2S+1Q16rTjU+cyWf5a8fKndgBGBQITeTeZi2qE/gk+Mzzm
	6ZVlCKDhJbWV3aGBTxt48M3fpe2HSFkFAI44Ox/PZwC/2e9TiLebXvDy+zNMDPAXwVux0ufEH/EjF
	ODgPI9Z9+ETVr6DDSDBEJQUmteF3IPJ/KKoEDCAj3wd67SAHehBFU73Md9Qoitwef7IH0YHdvqvlD
	7F7OZRJXWrm+25GgRn+IDkCQ/BQya03pkRTWHqsiY7hliLQ7916/5A79uA572j+cJPaMVY1l/oVuY
	sfwUyC5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPK6b-00BQS3-B3; Tue, 07 Feb 2023 09:17:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPK6Q-00BQLz-7Z; Tue, 07 Feb 2023 09:17:27 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7BE7E660206D;
	Tue,  7 Feb 2023 09:17:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675761445;
	bh=fR1g1ujgV6D1c5SgIcM5pGcpg92t2HBOBAeCLPYXs3s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QoIgYO5e0cwEvRMZ4ck8Era0JPahNcNQ41bqiSq5v23FCCn9o6Y4QoB+YFrU+RkCp
	 v9gFNO0l/zgI0OidYuqL4Dh127V7x02tDjHwugHzWKs1qYlOf6vaFyOo4YCtU6pD8q
	 sbkU7K3+l6m0syAwlgJb37QH9bPM5ifjLMpM7/17zRIe6mlZTdSig9tQXJ8OaQbIsu
	 6/WRck22M5s888PTF5OMHMLkllLJWgi4VCdifcIPpNqbyhcT5481fnZ85uvWCdnuaC
	 FehMtkylODtpcIgK3jC9xqmhcsagirrl8MRBb4GnZsq9sksF/iwIuIxh+JytAi0ENf
	 OZ3YpI90Wl/dQ==
Message-ID: <e6af03d9-196a-4c3a-a1a8-3da4d2b90b59@collabora.com>
Date: Tue, 7 Feb 2023 10:17:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 13/45] clk: mediatek: mt8167: Compress GATE_TOPx macros
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
 johnson.wang@mediatek.com, miles.chen@mediatek.com,
 chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com,
 msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com,
 zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
 yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com,
 sean.wang@mediatek.com, chen.zhong@mediatek.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
 <20230206152928.918562-14-angelogioacchino.delregno@collabora.com>
 <CAGXv+5E8FoVN7HoOpawMhhsKab7qs2F5NcRrpTf5TQiti7XUVA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5E8FoVN7HoOpawMhhsKab7qs2F5NcRrpTf5TQiti7XUVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_011726_447801_99322386 
X-CRM114-Status: GOOD (  14.14  )
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

Il 07/02/23 08:30, Chen-Yu Tsai ha scritto:
> On Mon, Feb 6, 2023 at 11:30 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Use the GATE_MTK macro to compress the GATE_TOP{0..5} macros.
>> No functional changes.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/clk/mediatek/clk-mt8167.c | 88 +++++++++----------------------
>>   1 file changed, 24 insertions(+), 64 deletions(-)
>>
>> diff --git a/drivers/clk/mediatek/clk-mt8167.c b/drivers/clk/mediatek/clk-mt8167.c
>> index 91669ebafaf9..97a443fdfc77 100644
>> --- a/drivers/clk/mediatek/clk-mt8167.c
>> +++ b/drivers/clk/mediatek/clk-mt8167.c
>> @@ -736,77 +736,37 @@ static const struct mtk_gate_regs top5_cg_regs = {
>>          .sta_ofs = 0x44,
>>   };
>>
>> -#define GATE_TOP0(_id, _name, _parent, _shift) {       \
>> -               .id = _id,                              \
>> -               .name = _name,                          \
>> -               .parent_name = _parent,                 \
>> -               .regs = &top0_cg_regs,                  \
>> -               .shift = _shift,                        \
>> -               .ops = &mtk_clk_gate_ops_setclr,        \
>> -       }
>> +#define GATE_TOP0(_id, _name, _parent, _shift)                 \
>> +       GATE_MTK(_id, _name, _parent, &top0_cg_regs,            \
>> +                _shift, &mtk_clk_gate_ops_setclr)
> 
> Nit: 100 characters should be enough to fit the whole GATE_MTK part in one
> line.
> 

Wanted to stay below 90, but there's effectively no real reason to do that,
so let's go to 100 cols!

> Otherwise,
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


Cheers,
Angelo

