Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3270C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Nov 2022 18:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6IVpnek7jp7RQNs0vIif8yhh7QCajs41fZS8TKx6p0=; b=FJZ6/WweUwtKa+sUEWBjIDde2K
	wWS6rXjs/rackYL7FujEEjiapHeILfHfte9w+oddJQYyfvOQE+RDtYWDgeviuaPTS09AO0SqNxsqL
	Z6AS3PYzb7angaNxxP3+nI5BuRQvTTs2GIzYPdEirlNWZ+b1S3lps/do+S5Mtm0b9jC4GChP4utCZ
	bA0WkegHgSFVkPIpr6OJHIipcs7fIsoHNdTauJQ05mdK+kvdr5nRz+JAgmIGcEAcxPdcYMlvKxlEv
	O8RUgN6OD6ezzumz4LLFUFfqCqpYgAzWNqmYWD5YhTn1B46LOMZo4Vo1Ye6oKxEug9my3yp2HuiGP
	1PqxQd4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovN7p-006xaG-1M; Wed, 16 Nov 2022 18:27:05 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovN7Y-006xPU-Rx; Wed, 16 Nov 2022 18:26:50 +0000
Received: by mail-qk1-x729.google.com with SMTP id s20so12236597qkg.5;
        Wed, 16 Nov 2022 10:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J6IVpnek7jp7RQNs0vIif8yhh7QCajs41fZS8TKx6p0=;
        b=h1qkaXFxcj98WnQoGy/PtLTyHKGmkvuMbnDfgO5LBZfcK0V831Al4rsNV3cGUNNLrY
         WGUAVyJEckfwatgwNiwuAcVIjSLufaTfSe14kj5G/QN4zlXUYVmBkJfPQgz+7VE0/mVf
         2Z8QYszEBNZa5kS+o8tpcRPTs1Qa0wgtxT9g0Ke4aR6CM/3PoWNelOqZ1kF9XqfJeW6e
         7zj/2gQcIDUR4gtTF/I1MbVxGIH9iap1yRfoh+FV9ySicHqPIJD3dEruBWQDBLFE1BwS
         S/wXPsTZlWw3VvIt+3me5p7VO5ZxwhHK3XDMrVuCtLb1gti16n7jXE+zyGjwVYq5p+Pu
         8utA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J6IVpnek7jp7RQNs0vIif8yhh7QCajs41fZS8TKx6p0=;
        b=G36CvNial5M0CdD6EAovOv5C7dcpiE9rsReg/j9qQzpIIr2Ys661t4DCwaYUqnoewk
         3qnmpwvpjJxGPnmhyVMEBNPxehVVc9lpZ1qhxpYNyvcMUhmVLL81Ajp9LcHw08TtQl3t
         8pY5gWbqYPRYnye7VyJA070lhupCR8Z8q1SjLPDX9TLKs/KMD40lgyz2VqLuGOSD0Ok6
         heJs3YWD0KpY5tdPwm9QvOMvLoYnK8d9M614+1JDpnN2XhodgNNm/GiRgD84wXE8G///
         0UR87pmYb+JlZh9CeCOw19kiY8stTrn0KDTuEj7dPG09g9MXVv9NstqWX9RgTkQvPC6Q
         dlaQ==
X-Gm-Message-State: ANoB5pndIiGvdiVlLXMIi3C3uLxklxVR/TlpyFZfrkvukcDmrSfHNhyB
	bxzCC7zPc1Qe8EiZBMYsbzM=
X-Google-Smtp-Source: AA0mqf53yxUvhGGS5Xx6pm5ju9mEcwGhd4nEqXg+sOyj8VWQ8fxrID1w4+NG5cvcE8lwWIQ2enh/rg==
X-Received: by 2002:ae9:ed81:0:b0:6fb:9f9c:fb1d with SMTP id c123-20020ae9ed81000000b006fb9f9cfb1dmr7126989qkg.499.1668623207254;
        Wed, 16 Nov 2022 10:26:47 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id cm26-20020a05622a251a00b0039cc82a319asm9126221qtb.76.2022.11.16.10.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 10:26:46 -0800 (PST)
Message-ID: <623b0d5d-98b7-0ef0-6622-69686ea49269@gmail.com>
Date: Wed, 16 Nov 2022 10:26:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH net-next 5/6] net: dsa: tag_mtk: assign per-port queues
Content-Language: en-US
To: Felix Fietkau <nbd@nbd.name>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221116080734.44013-1-nbd@nbd.name>
 <20221116080734.44013-6-nbd@nbd.name>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221116080734.44013-6-nbd@nbd.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_102648_932372_48DEC74F 
X-CRM114-Status: UNSURE (   4.86  )
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



On 11/16/2022 12:07 AM, Felix Fietkau wrote:
> Keeps traffic sent to the switch within link speed limits
> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

