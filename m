Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E83C433E6
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 08:50:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D445564E36
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 08:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D445564E36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9hXEPr9RYswa7PJlz5XcEGGKVUgCAgCZCRYkPmsRM6o=; b=ShM3XCFBkuhO8LSJudgyh966o
	1MA6gjsni5OFCUsgArTuDxFbeDghQ5OWkkLqUw2RDLLEYhQoJJk9XWb/OQBw1+NNCP1SSRV05DCoD
	8LIswJsV9iD04Us10LDhZX4+ikTnKhjas4x6LLWBCSbY/wd1nzNX6FEXJ7P+UBHhRnfpRZaGaTh43
	x8ZMPB25caqRXLqiI8I27hocdR9eQs39wAAwP8lUA5H5mH4GfkPxQ08LI0aXJz4roNOvaDFjcmmz4
	bOCZqLmmG6c3xoPqF/CMBXRA5yF8XKwvqdgIQE0EhhV106iyI8bGsFb3/9JnmWSdiXTUxjmIi+1fc
	i3MUtxLrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6Uv4-0002n0-1V; Mon, 01 Feb 2021 08:50:50 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6Uv0-0002m2-AV; Mon, 01 Feb 2021 08:50:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id o5so2216887wmq.2;
 Mon, 01 Feb 2021 00:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rIiV2l/8Qf1juG7z36n1KVoCTNYEzigbbx8ySlcRFIU=;
 b=qpwS4+w0No/kjqi9pPJi0b1UkW42lwpu9GiFvxw5B5qU8wh1TT4PzZOFNDpV9x0aMB
 559Kf9cmqogMtj/58X+kijNdaqWOrLanYVn7vOKPJR+6NMGAp+UDs5yjnIOxA8ZbHom8
 K+S4th4Ji8cxYidORiMybefEIwPFmaW1sWNSBBOeOkbRQOJGBdbAMYnIr1fHpb8SojfV
 oDCBSmWrgxZ3USTPdliDl16vLjnQCKaBnLZDW4aQMkTfabhI8rTbZgk5pHszFLVnFoEx
 b2RivGZucjjOGAl3nYOd6XdNBnRpZoyt8Z2+neh1jBYCDvbcACDgJwUrOh1J4GoQkfM8
 eKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rIiV2l/8Qf1juG7z36n1KVoCTNYEzigbbx8ySlcRFIU=;
 b=KRCO0TeNdfVr/L4/UeT4edEFWi2poGe+P/N7S6SRaxjGhXqL5kZh1VGVeiW92BI650
 4evBF6b2iVcmsZLeR8LzKb7u09JtDaB0qG1sNoFe7SM9YnPTAvqaYjg7k7BE3F6iQTKH
 o1tV08ql/TmKqJN08j0opFwCohxmVpt6+VQUFXcsw3sIQ/f/j1xE2eE9piJ/NTh3okfs
 uvSiIqAH0ZjwQmJM3tQ+o3YaSUiUSFEnZ1w9x2bn6wrbWfpaJhYHQLbZA7Ytr+dGSQXB
 J2MNtcDR8wuWhfy8Qh/Ozmjb4NIGztucTS9shTetAImBICQhp6CLUI0Se/h0kaBp1XsH
 ez1A==
X-Gm-Message-State: AOAM5324VgJOMfCaq4yzkmMBq2S8SoNqzbhiTsK85NX6KDgJABZZNtPk
 gGUM6k0IaJG2rfR99wUXYvmVLhL9NedlhEQ7
X-Google-Smtp-Source: ABdhPJwMG9i1Sej5MLrrFago+IjOeLAh/IFRWk11NBhciLuq+1qoY42wMuzwOISDhylXSmgSrk7Few==
X-Received: by 2002:a1c:408a:: with SMTP id n132mr5037245wma.86.1612169445107; 
 Mon, 01 Feb 2021 00:50:45 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id i7sm15842882wmq.2.2021.02.01.00.50.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 00:50:44 -0800 (PST)
Subject: Re: [PATCH v1 2/2] arm64: configs: Support DEVAPC on MediaTek
 platforms
To: Arnd Bergmann <arnd@kernel.org>
References: <1608713092-26952-1-git-send-email-neal.liu@mediatek.com>
 <1608713092-26952-3-git-send-email-neal.liu@mediatek.com>
 <68442164-d649-aee0-cfe8-c9ebb868612d@gmail.com>
 <CAK8P3a1DLX6y5GM3O7+T0gMH_JLRp6nUkHFZc4Shjn_bTKWWSw@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <7001eef4-42bd-0c17-50a3-4d619d0fc80a@gmail.com>
Date: Mon, 1 Feb 2021 09:50:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1DLX6y5GM3O7+T0gMH_JLRp6nUkHFZc4Shjn_bTKWWSw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_035046_400369_BA9CC7E4 
X-CRM114-Status: GOOD (  20.22  )
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
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, wsd_upstream <wsd_upstream@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Hanks Chen <Hanks.Chen@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neal Liu <neal.liu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Will Deacon <will@kernel.org>,
 Jackson-kt Chang <Jackson-kt.Chang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 31/01/2021 23:23, Arnd Bergmann wrote:
> On Sun, Jan 31, 2021 at 3:07 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>> On 23/12/2020 09:44, Neal Liu wrote:
>>> Support DEVAPC on MediaTek platforms by enabling CONFIG_MTK_DEVAPC.
>>>
>>> Signed-off-by: Neal Liu <neal.liu@mediatek.com>
>>> ---
>>>  arch/arm64/configs/defconfig |    1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>>> index 17a2df6..a373776 100644
>>> --- a/arch/arm64/configs/defconfig
>>> +++ b/arch/arm64/configs/defconfig
>>> @@ -257,6 +257,7 @@ CONFIG_MTD_NAND_MARVELL=y
>>>  CONFIG_MTD_NAND_FSL_IFC=y
>>>  CONFIG_MTD_NAND_QCOM=y
>>>  CONFIG_MTD_SPI_NOR=y
>>> +CONFIG_MTK_DEVAPC=m
>>>  CONFIG_SPI_CADENCE_QUADSPI=y
>>>  CONFIG_BLK_DEV_LOOP=y
>>>  CONFIG_BLK_DEV_NBD=m
>>>
>>
>> From my understanding, defconfig is for a minimal config that allows to boot a
>> machine. As MTK_DEVAPC is a rather exotic driver to detect bus access
>> violations, I think it's not a good candidate for inclusion in defconfig.
>>
>> In any case, I added the SoC maintainer, so that they can correct me, if I'm
>> wrong :)
> 
> I generally don't mind adding platform specific drivers as loadable modules
> even if they are somewhat obscure. For built-in drivers, this is
> different though,
> as those have a noticeable impact on other platforms.
> 
> I haven't kept track of what this particular driver does, but from the Kconfig
> description, I'd say it should get enabled in defconfig.
> 

Thanks for the feedback Arnd.
Applied now to v5.11-next/defconfig

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
