Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE71C001E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 09:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeZuXmpiEmno0bow7QoHwmir1t7SQOeK0Dqbujq52ps=; b=LtcAdk/wHByzAdfypsFGZPS4aw
	RhQTC92NUDZAXCYss3hujWsxrtzze2BrYb7BSm9jnY8F4O/R+lk281bmF3+aJpAeuC31YYPWydZaO
	HHuhvwXJNebKibCRw6ZHGqKLq+TTTb1lAJolm5CHeGLipScd+rYFa8U7U3Aa9aacqlk/WrCH12jF9
	toK2QNHOPY+nGq+pRvNsUVaciBJi/9QdeFFkZRkppjxzoBGOj4cAFpqg2o6Si1ttWoLMtTJboIECu
	59p68QHqx56Vx05Qol7Rlug0txc2gbBsy3aZ5nIeHmAciIY9i1kYEd+EZikLna/HkFhZlkAb1Hcln
	o8c2++Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJjS-002d7R-2a;
	Fri, 28 Jul 2023 09:25:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJjP-002d60-1f;
	Fri, 28 Jul 2023 09:25:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AFE01620A0;
	Fri, 28 Jul 2023 09:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F40C433C7;
	Fri, 28 Jul 2023 09:25:49 +0000 (UTC)
Message-ID: <2d9eeb0e-71b3-157c-b947-6dd5485f46e3@xs4all.nl>
Date: Fri, 28 Jul 2023 11:25:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v7,0/11] media: mediatek: vcodec: separate encoder and
 decoder
Content-Language: en-US
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230722074230.30558-1-yunfei.dong@mediatek.com>
 <231e9976-93fe-b8b1-29d9-6c799a8e6a3a@xs4all.nl>
In-Reply-To: <231e9976-93fe-b8b1-29d9-6c799a8e6a3a@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_022555_661313_1459B19A 
X-CRM114-Status: GOOD (  18.95  )
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

On 25/07/2023 11:58, Hans Verkuil wrote:
> On 22/07/2023 09:42, Yunfei Dong wrote:
>> From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>
>>
>> With the driver more and more complex, encoder and decoder need to add more parameter
>> in shared struct 'mtk_vcodec_ctx' and 'mtk_vcodec_dev'. Encoder use about 40% and
>> decoder use 60% parameter. Need to allocate extra unused memory when encoder and decoder
>> working.
>>
>> Separate encoder and decoder in different folder and use independent data struct.
>>
>> patch 1 remove unused parameter.
>> patch 2~3 align fw and interrupt related interface.
>> patch 4~6 remove the dependency of debug log
>> patch 7~8 separate mtk_vcodec_ctx and mtk_vcodec_dev
>> patch 9 fix unreasonable parameter
>> patch 10 removed unused header files
>> patch 11 separate encoder and decoder in different folder
>> ---
>> Changed from v6:
>> - rebase to: https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=fo-v6.6g.
>> Changed from v5:
>> - fix some words error for patch 3/6/11.
>> - rename mtk_vcodec_comm_drv.h to mtk_vcodec_cmn_drv.h for patch 7.
>> Changed from v4:
>> - add one parameter to record register base for reg_base for patch 3.
>> - add debug string for non ctx log for patch 6.
>> - change the comment of struct mtk_vcodec_dec_ctx and struct mtk_vcodec_enc_ctx for patch 7.
>> - prefer to use struct mtk_vcodec_dec_dev an current period, will re-construct in the future for patch 8.
>> Changed from v3:
>> - re-write commit message for patch 3.
>> Changed from v2:
>> - This patch main changed:
>>   1: add different macro mtk_dec_debug and mtk_enc_debug calling common
>>      macro mtk_vcodec_debug in order to use dev_dbg instead of pr_debug.
>>   2: add different macro mtk_v4l2_venc_dbg and mtk_v4l2_vdec_dbg calling common
>>      macro  in order to use dev_dbg instead of pr_debug.
>> Changed from v1:
>> - Change pr_dbg to dev_dbg for mtk_v4l2_level and mtk_vcodec_dbg for patch 4.
>> - Change pr_err to dev_err for mtk_v4l2_err and mtk_vcodec_err for patch 5.
>> - Fix unreasonable parameter for patch 8.
>> ---
>> Yunfei Dong (11):
>>   media: mediatek: vcodec: remove unused parameter
>>   media: mediatek: vcodec: align fw interface
>>   media: mediatek: vcodec: Removing struct 'mtk_vcodec_ctx/dev' for
>>     shared interface
>>   media: mediatek: vcodec: Removing useless debug log
>>   media: mediatek: vcodec: remove the dependency of vcodec debug log
>>   media: mediatek: vcodec: replace pr_* with dev_* for v4l2 debug
>>     message
>>   media: mediatek: vcodec: separate struct 'mtk_vcodec_ctx'
>>   media: mediatek: vcodec: separate struct mtk_vcodec_dev
>>   media: mediatek: vcodec: fix unreasonable parameter definition and
>>     style
>>   media: mediatek: vcodec: remove unused include header
>>   media: mediatek: vcodec: separate decoder and encoder
> 
> Besides the missing argument in patch 6/11 I also get this compiler warning:
> 
> drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c: In function 'vpu_enc_ipi_handler':
> drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c:64:31: warning: 'vpu' may be used uninitialized [-Wmaybe-uninitialized]
>    64 |         struct venc_vpu_inst *vpu;
>       |                               ^~~
> 
> and this smatch error:
> 
> drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c:138 mtk_vcodec_get_reg_bases() error: buffer overflow 'mtk_dec_reg_names' 11 <= 11
> 
> However, I believe that was introduced by Nicolas' patch series.
> 
> I'll try to pinpoint the precise patch.

That smatch error is now found and fixed in the staging tree.

Can you post a v8 fixing the other issues?

Thanks!

Regards,

	Hans

> 
> Regards,
> 
> 	Hans


