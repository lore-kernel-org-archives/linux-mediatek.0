Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94A5C48BC3
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 09:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVh1cYv4twhxZ2ER7C+Bz1CnG1o81R69G1bhEnGU42w=; b=PVE31/IBuOtLDICW1fsU+zhhid
	HEX6CUFCc/Sn5U8nd2M9xj6C42bKEQ8LTGtuLpvW2jmED4WOf8ky77iX1RzDmx+o2WPn0wcSOiHki
	4F7UbC0yi+acdOlC+cRMFWshWU8tBl65oS3e/Lm47ZwkFJXc9uMCkCMb0jEq1pPQm0wcssVwnHl1+
	cJbu2Lnm3wafl2UHh9RhQZvzo6NyxEBMSbNoVF6KU/F3GsVjiMM0jTBGDYguTsWVhxf5tMrBj8DEx
	SmH7gS244aXVHqTgayEXZhgJD0a/XR2hSbTra/hjC+Vb2sQNtihFsCMr8J+W9frJyf8HN+I7jhFP9
	4UVDdVzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rciUX-000000009ur-0zla;
	Wed, 21 Feb 2024 09:02:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rciUU-000000009uF-0i1W;
	Wed, 21 Feb 2024 09:02:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 16AA4CE19B3;
	Wed, 21 Feb 2024 09:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D60CC433F1;
	Wed, 21 Feb 2024 09:02:05 +0000 (UTC)
Message-ID: <852dea56-336a-4484-8754-ee735af7bdaf@xs4all.nl>
Date: Wed, 21 Feb 2024 10:02:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: cec: core: remove length check of Timer Status
To: =?UTF-8?B?TmluaSBTb25nICjlrovlrpvlpq4p?= <Nini.Song@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?UTF-8?B?Q0kgV3UgKOS8jeWAieWEhCk=?= <ci.wu@mediatek.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "nicolas@fjasle.eu" <nicolas@fjasle.eu>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>
References: <20240125132850.10430-1-nini.song@mediatek.com>
 <8a4447ba-d4ac-40ac-9d6b-796db37f3100@xs4all.nl>
 <089a5abf85fb3aaa57cb9436193b09eea47a03d2.camel@mediatek.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <089a5abf85fb3aaa57cb9436193b09eea47a03d2.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_010210_569808_4285C9B0 
X-CRM114-Status: GOOD (  26.61  )
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

Dear Nini,

Unfortunately I forgot to add a 'Fixes' tag to the patch, if I had, then it would
have happened automatically.

Please remind me of this once kernel 6.9-rc1 is released since that will contain
the fix. Then I can post the same patch to the stable mailinglist for inclusion in
older kernels.

It has to wait until 6.9-rc1 is release though, patches need to be in mainline first
before they can be backported.

Regards,

	Hans

On 21/02/2024 07:30, Nini Song (宋宛妮) wrote:
> Dear Hans,
> 
> Thank your reply.
> Could you also help to marge solution into v5.15? Our customer used v5.15 for MP production, which requires this solution.
> 
> 
> BR,
> Nini Song
> On Mon, 2024-02-05 at 13:00 +0100, Hans Verkuil wrote:
>> 	
>>
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>> On 25/01/2024 14:28, nini.song@mediatek.com wrote:
>> > From: "nini.song" <nini.song@mediatek.com>
>> > 
>> > The valid_la is used to check the length requirements,
>> > including special cases of Timer Status. If the length is
>> > shorter than 5, that means no Duration Available is returned,
>> > the message will be forced to be invalid.
>> > 
>> > However, the description of Duration Available in the spec
>> > is that this parameter may be returned when these cases, or
>> > that it can be optionally return when these cases. The key
>> > words in the spec description are flexible choices.
>>
>> Good catch, the spec indeed says 'may', so dropping the check
>> in this patch is the correct thing to do.
>>
>> It's merged in our staging tree and it will appear in v6.9.
>>
>> Regards,
>>
>> Hans
>>
>> > 
>> > Remove the special length check of Timer Status to fit the
>> > spec which is not compulsory about that.
>> > 
>> > Signed-off-by: Nini Song <nini.song@mediatek.com>
>> > ---
>> >  drivers/media/cec/core/cec-adap.c | 14 --------------
>> >  1 file changed, 14 deletions(-)
>> > 
>> > diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
>> > index 5741adf09a2e..559a172ebc6c 100644
>> > --- a/drivers/media/cec/core/cec-adap.c
>> > +++ b/drivers/media/cec/core/cec-adap.c
>> > @@ -1151,20 +1151,6 @@ void cec_received_msg_ts(struct cec_adapter *adap,
>> >  if (valid_la && min_len) {
>> >  /* These messages have special length requirements */
>> >  switch (cmd) {
>> > -case CEC_MSG_TIMER_STATUS:
>> > -if (msg->msg[2] & 0x10) {
>> > -switch (msg->msg[2] & 0xf) {
>> > -case CEC_OP_PROG_INFO_NOT_ENOUGH_SPACE:
>> > -case CEC_OP_PROG_INFO_MIGHT_NOT_BE_ENOUGH_SPACE:
>> > -if (msg->len < 5)
>> > -valid_la = false;
>> > -break;
>> > -}
>> > -} else if ((msg->msg[2] & 0xf) == CEC_OP_PROG_ERROR_DUPLICATE) {
>> > -if (msg->len < 5)
>> > -valid_la = false;
>> > -}
>> > -break;
>> >  case CEC_MSG_RECORD_ON:
>> >  switch (msg->msg[2]) {
>> >  case CEC_OP_RECORD_SRC_OWN:
>>
>>


