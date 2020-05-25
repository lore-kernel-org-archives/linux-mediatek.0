Return-Path: <SRS0=WPHR=7H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C23CC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 May 2020 10:49:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31A262087D
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 May 2020 10:49:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MGM8+RDf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TFV31XXk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31A262087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bKiuCKpQq+Bh0Y+1B096jjy9K8tV7JW1tKQN7i552Ts=; b=MGM8+RDfy7Xx2f
	oZQRXRHG22DEuJwG4j7L06VJ5gmvr2vZFpi6w/TOpS7cMRNOGBG/hGnUTpdopT/DgT/Sq3Xuk+ccg
	IwKv54or5uhkxiv9QKXAegU1cd2UdkzSf9vYfX+2k/Qr2FFZruDnwBOZNBqkMXia+SxujgoFNu481
	eErl1cx4uurgmR3QAwr9bBG5NF8Bj/IhnGvze/L1I7wB4f9qiW4HmCNsgdWs8fOf+m0KbdfVCoib9
	7ofkVUfotpeLGrv87iqbFA+NQB1bpA6pnL/bBJ21nsmkRZffCr/q3A+pYO0YyGXclOpSIwzFuZWW2
	BmN988pusdWhEGSan5bw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdAfY-0006ep-RX; Mon, 25 May 2020 10:49:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdAfM-0006SK-0X; Mon, 25 May 2020 10:49:09 +0000
X-UUID: 287278e0d6c2438bb106d2f51e8fdd5d-20200525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hP4MHL5rKzsU6+cwtk/2ybNDnctT2+yEC11C/Esk5/o=; 
 b=TFV31XXk0/x4ej3Ymtimxwcrrma9XVcGvxZz7avtFxr2/iH2tEeES+QIuID+MfsKKeiNzCmLdv5KLmXSNa/sCoWuR0hWAM/0de5El/Gpr/QlfSjJImfN/eGlNB8NexisAOeNIxltC0n1gsAvJx0rdeiI0YToMZEalf8Med1Sv+w=;
X-UUID: 287278e0d6c2438bb106d2f51e8fdd5d-20200525
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 914228624; Mon, 25 May 2020 02:49:03 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 May 2020 03:38:58 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 May 2020 18:38:42 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 May 2020 18:38:44 +0800
Message-ID: <1590403125.11988.5.camel@mtkswgap22>
Subject: Re: [PATCH v5 09/13] soc: mediatek: cmdq: add write_s value function
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 25 May 2020 18:38:45 +0800
In-Reply-To: <68535bf6-9824-5077-4811-374c893cdc03@gmail.com>
References: <1583664775-19382-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583664775-19382-10-git-send-email-dennis-yc.hsieh@mediatek.com>
 <f9fd9ea8-f706-ed4a-4c83-c53ad092035c@gmail.com>
 <1590341462.31286.19.camel@mtkswgap22>
 <eb604637-28f0-fa8f-ce4b-3e87f6c944ad@gmail.com>
 <1590373621.31522.7.camel@mtkswgap22>
 <68535bf6-9824-5077-4811-374c893cdc03@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7C8ADAEBEC808D17B27E76EFF3A38C58E804BDAD7674469778D687D1892779672000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_034908_073383_1613415C 
X-CRM114-Status: GOOD (  22.72  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, wsd_upstream@mediatek.com,
 David Airlie <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 HS Liao <hs.liao@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Mon, 2020-05-25 at 10:39 +0200, Matthias Brugger wrote:
> 
> On 25/05/2020 04:27, Dennis-YC Hsieh wrote:
> > 
> > On Sun, 2020-05-24 at 20:13 +0200, Matthias Brugger wrote:
> >>
> >> On 24/05/2020 19:31, Dennis-YC Hsieh wrote:
> >>> Hi Matthias,
> >>>
> >>> Thanks for your comment.
> >>>
> >>> On Sat, 2020-05-16 at 20:20 +0200, Matthias Brugger wrote:
> >>>>
> >>>> On 08/03/2020 11:52, Dennis YC Hsieh wrote:
> >>>>> add write_s function in cmdq helper functions which
> >>>>> writes a constant value to address with large dma
> >>>>> access support.
> >>>>>
> >>>>> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> >>>>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> >>>>> ---
> >>>>>  drivers/soc/mediatek/mtk-cmdq-helper.c | 26 ++++++++++++++++++++++++++
> >>>>>  include/linux/soc/mediatek/mtk-cmdq.h  | 14 ++++++++++++++
> >>>>>  2 files changed, 40 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> >>>>> index 03c129230cd7..a9ebbabb7439 100644
> >>>>> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> >>>>> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> >>>>> @@ -269,6 +269,32 @@ int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
> >>>>>  }
> >>>>>  EXPORT_SYMBOL(cmdq_pkt_write_s);
> >>>>>  
> >>>>> +int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
> >>>>> +			   u16 addr_low, u32 value, u32 mask)
> >>>>> +{
> >>>>> +	struct cmdq_instruction inst = { {0} };
> >>>>> +	int err;
> >>>>> +
> >>>>> +	if (mask != U32_MAX) {
> >>>>> +		inst.op = CMDQ_CODE_MASK;
> >>>>> +		inst.mask = ~mask;
> >>>>> +		err = cmdq_pkt_append_command(pkt, inst);
> >>>>> +		if (err < 0)
> >>>>> +			return err;
> >>>>> +
> >>>>> +		inst.op = CMDQ_CODE_WRITE_S_MASK;
> >>>>> +	} else {
> >>>>> +		inst.op = CMDQ_CODE_WRITE_S;
> >>>>> +	}
> >>>>> +
> >>>>> +	inst.sop = high_addr_reg_idx;
> >>>>
> >>>> Writing u16 value in a 5 bit wide variable?
> >>>
> >>> We need only 5 bits in this case. I'll change high_addr_reg_idx
> >>> parameter to u8.
> >>>
> >>
> >> Ok, please make sure to mask the value, so that it's explicit in the code that
> >> we only use the lowest 5 bits of high_addr_reg_idx.
> > 
> > Is it necessary to mask the value?
> > Since sop already defined as "u8 sop:5;", I thought it is explicit that
> > only use 5 bits and compiler should do the rest jobs.
> 
> Yes but it makes the code more explicit if we have a
> inst.sop = high_addr_reg_idx & 0x1f;
> 
> What do you think?

The value assign to sop will restrict by hardware spec. Clients call
this function will define constant value and use it as parameter. So I
think we don't worry about client call this api with wrong value.


Regards,
Dennis

> 
> Regards,
> Matthias
> 
> > 
> > 
> > Regards,
> > Dennis
> > 
> >>
> >> Regards,
> >> Matthias
> >>
> >>>>
> >>>>> +	inst.offset = addr_low;
> >>>>> +	inst.value = value;
> >>>>> +
> >>>>> +	return cmdq_pkt_append_command(pkt, inst);
> >>>>> +}
> >>>>> +EXPORT_SYMBOL(cmdq_pkt_write_s_value);
> >>>>> +
> >>>>>  int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
> >>>>>  {
> >>>>>  	struct cmdq_instruction inst = { {0} };
> >>>>> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> >>>>> index 01b4184af310..fec292aac83c 100644
> >>>>> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> >>>>> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> >>>>> @@ -135,6 +135,20 @@ int cmdq_pkt_read_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx, u16 addr_low,
> >>>>>  int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
> >>>>>  		     u16 addr_low, u16 src_reg_idx, u32 mask);
> >>>>>  
> >>>>> +/**
> >>>>> + * cmdq_pkt_write_s_value() - append write_s command with mask to the CMDQ
> >>>>> + *			      packet which write value to a physical address
> >>>>> + * @pkt:	the CMDQ packet
> >>>>> + * @high_addr_reg_idx:	internal regisger ID which contains high address of pa
> >>>>
> >>>> register
> >>>
> >>> will fix
> >>>
> >>>
> >>> Regards,
> >>> Dennis
> >>>
> >>>>
> >>>>> + * @addr_low:	low address of pa
> >>>>> + * @value:	the specified target value
> >>>>> + * @mask:	the specified target mask
> >>>>> + *
> >>>>> + * Return: 0 for success; else the error code is returned
> >>>>> + */
> >>>>> +int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
> >>>>> +			   u16 addr_low, u32 value, u32 mask);
> >>>>> +
> >>>>>  /**
> >>>>>   * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
> >>>>>   * @pkt:	the CMDQ packet
> >>>>>
> >>>
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
