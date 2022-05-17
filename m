Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E781C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 09:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DYk9phDgZsBLO6UiN9n0UCakmGPiat5+lQAXGqmOK/w=; b=beElSFgd1Vru8S
	qKA/j3czw4yz8lDI68EdIsn2yx7z2QqTH/3iaUiqh7zMPVHv3vWiRuv30CcnBL9PSZWeddtyRT3m/
	le8DygH9+yatHpibIJtJUTzZWic7t3deRyROwtm2X4EI1vQFW+ty/QnL6l5LILDYm96VzCKCvxxrx
	KAcR/NCb7lW6R5un21joYZitQHtUbpM3RfGzjKHcbKON03/WOHFkdFj2BrUD6N1wY+kfjIQ9VM+hM
	t7d9V4K6vFm3na19F2EYNcveHYobgS8pggogEudTlcSaYZNSv7/yCnZUPOzkjq+WjQy3gQ7gStpWW
	pNGI3tIVGtfsM7JPYScw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqtxk-00Ctw8-Er; Tue, 17 May 2022 09:57:56 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqtxX-00Ctsn-41; Tue, 17 May 2022 09:57:44 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 r6-20020a1c2b06000000b00396fee5ebc9so977323wmr.1; 
 Tue, 17 May 2022 02:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vkbPSe6+lbN9CgRiuIs5X2zmL0tJEg4PuoARLaGrjvs=;
 b=OosLfLz7al3FcOZC7A+KBKjtG62QHZMTp+4/P4+CXZ6od3wajq6h0IvIK++O4SRbnc
 fK0X36zpiYXLjUGV5JSdKvbFIeSGqyWxjC6Eu6LhzNq0/vBW22bNpbyoTzYkiTnIbZmx
 7m+X1EVuosimr7zWLMXeOQxDDzfTpUFxqTQNlpouG/kOhBT/rcFTBcE33zZRgpJ0KOo5
 MrPKmLtsyjUkbTyQWr4+DBCwMD9jDv0g2DT7nWMOuTgwrqH1stHzbxS31l4cEXrzwbgk
 nnfnZjrlHwx5rFT+F1Px1Zb9D+irjdobOmsFHehYqON55+owGp+IDa6Z+gtWv3DTsfi2
 MWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vkbPSe6+lbN9CgRiuIs5X2zmL0tJEg4PuoARLaGrjvs=;
 b=47MnoyMArSpGJyKu9FIR+O7XvQs2IpB6bGpqxCfw2MH5vCeH0vjfk58GsgtPFTS4VY
 +H7arO7KA5oU6/aNwJeig7qACQT+VpcHkA5IcjgHFiTS2jS62Pf5PDZYD5IX/2IVMRWS
 CmzBBx99+2bAfcorIOkc+BUgnEy7bGhc4UFg1jYI0JqixI8Gy5DCTe8ClW5Zq4Gyuf94
 ziDOTxYwtA17bcxRRiLvcLaqIW21YMs+L5TaMhQjWRz8QqGNVe4+ResfPeKPk53UcTY5
 HculovySLqkTV8Dzv1LtCCRiQaUlavYmUkNBOQpNzfpTjTG+BIpZuzJ+H7sQ6XG5wvrR
 yOcQ==
X-Gm-Message-State: AOAM533iHuVBP9dtXe6Vpz9T5+tnCTt8QBTKaAiPzX6uiYJsacvaY+0k
 lu0BkBNEkIKT99itcFsprsw=
X-Google-Smtp-Source: ABdhPJx2Y7sHu8IoFE8w1v+BrUgCcLNWC3tjiunbkuXLBwpxYw6yZeq3jVkMV9Vc9/hzmXYODRpJ6Q==
X-Received: by 2002:a05:600c:240a:b0:394:18b:d722 with SMTP id
 10-20020a05600c240a00b00394018bd722mr31834039wmp.177.1652781459678; 
 Tue, 17 May 2022 02:57:39 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adfa70d000000b0020c5253d8bfsm12028639wrd.11.2022.05.17.02.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 02:57:39 -0700 (PDT)
Message-ID: <dde746ce-5663-e12f-4537-4206945b6b59@gmail.com>
Date: Tue, 17 May 2022 11:57:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 00/10] cpufreq: mediatek: Cleanup and support MT8183
 and MT8186
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: rafael@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 jia-wei.chang@mediatek.com, roger.lu@mediatek.com, hsinyi@google.com,
 khilman@baylibre.com, angelogioacchino.delregno@collabora.com,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220505115226.20130-1-rex-bc.chen@mediatek.com>
 <20220506042004.hqzpb66shak4y7rz@vireshk-i7>
 <86851bd03128cc61082d516ebff929d3637063cb.camel@mediatek.com>
 <20220512052732.iqphgpveoyrqjlqg@vireshk-i7>
 <af82434adea0b648d74ed5ffd123e0faaaac6508.camel@mediatek.com>
 <20220512054825.aqe4g4lupuqj3rcq@vireshk-i7>
 <ca85977bcff2e3de925d7ab834b8654ec5ddf8c1.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <ca85977bcff2e3de925d7ab834b8654ec5ddf8c1.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_025743_215238_ABCE18C9 
X-CRM114-Status: GOOD (  10.77  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 12/05/2022 08:05, Rex-BC Chen wrote:
> On Thu, 2022-05-12 at 11:18 +0530, Viresh Kumar wrote:
>> On 12-05-22, 13:33, Rex-BC Chen wrote:
>>> Matthias is not the member of mediatek, so I think we still need
>>> his
>>> feedback for these three patches.
>>
>> Please ping him and ask for his feedback then.
>>
> 
> ok, I will do this.
> Thanks!
> 

Sorry for the late reply. I'll take the DTS patches through my tree. As I'm late 
to the game this will be for v5.20.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
