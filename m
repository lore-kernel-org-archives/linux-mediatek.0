Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0F2C4828D
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 12:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyMfTzarMsn+VMC2pMy5sw7PNp4pvfoaeBDxyAfKiXQ=; b=PJi22wWNP3hJ8F38eF2x2IGCsq
	ikEw4gxhmbYtMZ9vD1EjvEYo1Php5CmoFfhkqzGojz0iIofMRIPwTI3VCvvRKg16qc8mF9qlb05Kk
	YhgmZyGFLbuFztxzzLMiZqRieahvlozw4qdvsE1r0PrIEHXNZoTwa5v0diKjeCbzdD743050jyfnK
	En4YOxcdfM2WNHmELwYDg4uhrX1L9kjMCQaQXkJtFA305H5RkTO7FxzAJdx8ta5l/9ug22qtbj++o
	XJCAyXo3IHpEJyxaXgB1ZxvOwmHHQqUX9t3I/1bAamCt5+li7VnZ4DfpiqSbge34Yg+1GTXh/v8jr
	IjAZ09IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWxe1-000000035Dv-3tXk;
	Mon, 05 Feb 2024 12:00:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWxdy-000000035CZ-31fH;
	Mon, 05 Feb 2024 12:00:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3B58C60FB6;
	Mon,  5 Feb 2024 12:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3C6C433C7;
	Mon,  5 Feb 2024 12:00:07 +0000 (UTC)
Message-ID: <8a4447ba-d4ac-40ac-9d6b-796db37f3100@xs4all.nl>
Date: Mon, 5 Feb 2024 13:00:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: cec: core: remove length check of Timer Status
Content-Language: en-US, nl
To: nini.song@mediatek.com
Cc: ci.wu@mediatek.com, mchehab@kernel.org, nicolas@fjasle.eu,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org
References: <20240125132850.10430-1-nini.song@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240125132850.10430-1-nini.song@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_040010_834564_52C1A276 
X-CRM114-Status: GOOD (  21.46  )
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

On 25/01/2024 14:28, nini.song@mediatek.com wrote:
> From: "nini.song" <nini.song@mediatek.com>
> 
> The valid_la is used to check the length requirements,
> including special cases of Timer Status. If the length is
> shorter than 5, that means no Duration Available is returned,
> the message will be forced to be invalid.
> 
> However, the description of Duration Available in the spec
> is that this parameter may be returned when these cases, or
> that it can be optionally return when these cases. The key
> words in the spec description are flexible choices.

Good catch, the spec indeed says 'may', so dropping the check
in this patch is the correct thing to do.

It's merged in our staging tree and it will appear in v6.9.

Regards,

	Hans

> 
> Remove the special length check of Timer Status to fit the
> spec which is not compulsory about that.
> 
> Signed-off-by: Nini Song <nini.song@mediatek.com>
> ---
>  drivers/media/cec/core/cec-adap.c | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
> index 5741adf09a2e..559a172ebc6c 100644
> --- a/drivers/media/cec/core/cec-adap.c
> +++ b/drivers/media/cec/core/cec-adap.c
> @@ -1151,20 +1151,6 @@ void cec_received_msg_ts(struct cec_adapter *adap,
>  	if (valid_la && min_len) {
>  		/* These messages have special length requirements */
>  		switch (cmd) {
> -		case CEC_MSG_TIMER_STATUS:
> -			if (msg->msg[2] & 0x10) {
> -				switch (msg->msg[2] & 0xf) {
> -				case CEC_OP_PROG_INFO_NOT_ENOUGH_SPACE:
> -				case CEC_OP_PROG_INFO_MIGHT_NOT_BE_ENOUGH_SPACE:
> -					if (msg->len < 5)
> -						valid_la = false;
> -					break;
> -				}
> -			} else if ((msg->msg[2] & 0xf) == CEC_OP_PROG_ERROR_DUPLICATE) {
> -				if (msg->len < 5)
> -					valid_la = false;
> -			}
> -			break;
>  		case CEC_MSG_RECORD_ON:
>  			switch (msg->msg[2]) {
>  			case CEC_OP_RECORD_SRC_OWN:


