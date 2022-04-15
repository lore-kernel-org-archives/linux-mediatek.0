Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5841DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 00:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WKClXlwW42RCfVJt5CN7d8LpCYSKNlvlavdleEsdNJQ=; b=IKv7xIUD8yNNjD
	zpNeCrnukAQQ9LWZrgd+IPJZOBzhkwXaE9ywX/SY25719w/WnYV+E9j4YdYpRHcqimDLlhbqdsXnv
	KRcOrKxQfUmWftu+Eq0vAl45MEKhUeW+29qzwZyh84AEFLlsfyoWeIzlYXsk/YqDnlNA8NF/ryotc
	3OctMuGe21fhdU1zN0XRAtQf5J3tjBI/8MRigqhI54yp7nRNkcZB2uVrPK7oG5ilZb13Ev25z+atV
	8ELlwHXvSFC4bCtLiWyAGMKgHGJah2gL3MHHapKOgTqPQ3nnmIHihtuQVJQyQtZCPxeSl5k4Eor0p
	TAVBkx2vkpdceQf/LbjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf9PO-007qlO-HY; Fri, 15 Apr 2022 00:01:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf9PE-007qig-3Z; Fri, 15 Apr 2022 00:01:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=v2Dn6qtvKX9phF9c++5hboesgqNOkOUVB6NrTw92XNw=; b=qjfgI842dUFH+bNI1oFu9a4fJi
 17/vob0IxmH8C1n6WdZhGqOstu6pL3DY33dsJ48tiDWfJEjHhxmaxNj+Gw273XjBGPCUhuotBzCBr
 iNlqogqPRlmOFIM4Q4wsKow+BZzCDFnqt+ve9nOd8p8LcNAKn5ShUAIldrZL32xiWbhL7Qe3av3q5
 5zDpaDra5C3dTfPhcQkBwULaN7QIGMcnY+SqIvtoZT/8ivzwqZFzSzUfH/n9kEenDYrW11qjGnKxO
 nPTyHV8W8IOnWvVTgEJnmJTtDf6R+aD1xYoiBdlqZl1+gN4B+Ez/CnCUP8D9S+3PnA0UvZBW3fnbb
 Bz/Bc6Cg==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf9P8-005Bn5-Sb; Fri, 15 Apr 2022 00:01:39 +0000
Message-ID: <292dcb6e-6f23-7e61-7927-5b6fe5911f97@infradead.org>
Date: Thu, 14 Apr 2022 17:01:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next V2] sound/oss/dmasound: fix 'dmasound_setup' defined
 but not used
Content-Language: en-US
To: Miles Chen <miles.chen@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220414091940.2216-1-miles.chen@mediatek.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220414091940.2216-1-miles.chen@mediatek.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 4/14/22 02:19, Miles Chen wrote:
> We observed: 'dmasound_setup' defined but not used error with
> COMPILER=gcc ARCH=m68k DEFCONFIG=allmodconfig build.
> 
> Fix it by adding __maybe_unused to dmasound_setup.
> 
> Error(s):
> sound/oss/dmasound/dmasound_core.c:1431:12: error: 'dmasound_setup' defined but not used [-Werror=unused-function]
> 
> Fixes: 9dd7c46346ca ("sound/oss/dmasound: fix build when drivers are mixed =y/=m")
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> Cc: Takashi Iwai <tiwai@suse.com>
> 

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> 
> Change sinve v1:
>  add fixes tag
>  use __maybe_unused
> 
> ---
>  sound/oss/dmasound/dmasound_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/oss/dmasound/dmasound_core.c b/sound/oss/dmasound/dmasound_core.c
> index 9c48f3a9e3d1..164335d3c200 100644
> --- a/sound/oss/dmasound/dmasound_core.c
> +++ b/sound/oss/dmasound/dmasound_core.c
> @@ -1428,7 +1428,7 @@ void dmasound_deinit(void)
>  		unregister_sound_dsp(sq_unit);
>  }
>  
> -static int dmasound_setup(char *str)
> +static int __maybe_unused dmasound_setup(char *str)
>  {
>  	int ints[6], size;
>  

-- 
~Randy

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
