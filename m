Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D612CD1292
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 08:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGA13cAnkY6mPpbzSMgevDLYB9+Tr41gsznS2L+gZR4=; b=TmsLyoh3u22IQ6yw2j8tuH78Aw
	rBB6uDAqQofDAGjmtNcCx0Aly2ZuN6J4oP7DMGZrj592vPluz9qzoPSVKSpOBejEoGCIvnXkpCmdM
	86f+9bqVkzKTvOmqTWxeCBgXg62yuEngxDJJP6pooID52cML7Q1+mEU5MtQPpZVYlCTCqULI5VVhe
	17661v6+tBzj1RgIylL82WKE6V6EXrO3eqzZ1jee+yqs1mCBRsd+Wk6Cn5xqg61jB1FAYBG4ML3sa
	28P1OjvD6HP7vjDAyvL7RGqvMb2/meZUy9SnvWuNGutQVY/H2uExuPyalNaqUgy2RmZXP0G9NWM8t
	3O55+6qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsIeV-00000001su6-3Oph;
	Thu, 04 Apr 2024 08:40:55 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsIeR-00000001stA-3RDS;
	Thu, 04 Apr 2024 08:40:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B023FCE203F;
	Thu,  4 Apr 2024 08:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC91EC433C7;
	Thu,  4 Apr 2024 08:40:46 +0000 (UTC)
Message-ID: <1caa6a4c-d4c1-474a-abf2-63384dba3cbb@xs4all.nl>
Date: Thu, 4 Apr 2024 10:40:44 +0200
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
X-CRM114-CacheID: sfid-20240404_014052_154670_FA92FF1E 
X-CRM114-Status: GOOD (  23.89  )
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

Hi Nini,

This patch has now been merged in mainline as commit ce5d241c3ad45
("media: cec: core: remove length check of Timer Status").

To get this into older kernels please post this patch to
stable@vger.kernel.org, CC the linux-media mailinglist, and mention the
mainline commit that I provided above.

Also mention that this patch applies to 5.10 and up. You can mention
that the patch applies to 5.4 and 4.19 as well after removing the '/core'
directory from the pathnames.

Since you are the author of the patch, you should be the one to post
the patch.

Regards,

	Hans


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


