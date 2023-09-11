Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354EDEE7FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 13:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2yRSNijSEry1q3t5KG0YspbSUTWaMB7q8b9zVPDgfQ=; b=VAt71MwqUQowanQvaA4sXfkRwj
	ES4W7qm+NQ0lIidzvB0pd6z1gPpKfBeCwVgiOvPsnTgzGbJk9JoiVTx/4tRNNXNN0ibDlG7SkLZDn
	aOTyqLrkHVZTQAPpDdi6ETPLTropOcIR6Gn+eQEIrE0zDhp8DbONKpqFe8M/x6/VPA6tbqToDhi9z
	htYrXWE3AUvsAuS41BRy5kFCFGGoPyVeq0iPoJIrDStsZu7bFLYjldJLGVfqVS5gMLs7Cuq59QJ2H
	vcDIM7ZFeScGZgPxNmrrwYurXeqGEfJ/bkF+scQKTwUyD2YcWmIQXZWVu6e40lT13v/S8bukvlZh7
	mKtgFErw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfglC-000aGF-05;
	Mon, 11 Sep 2023 13:15:26 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfgl7-000aEI-2r;
	Mon, 11 Sep 2023 13:15:24 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1c09673b006so28339425ad.1;
        Mon, 11 Sep 2023 06:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694438116; x=1695042916; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T2yRSNijSEry1q3t5KG0YspbSUTWaMB7q8b9zVPDgfQ=;
        b=jGRxSJDRcyEzEj/L3mg1py6DXupORctSVwn0wNuLuhHXmGRjT2uOcuSVEOvmODmtgf
         6P7GBd09Kk0zApChuI8om7A4U99dAebKGY3EkUoB7wfg4kNgUs6Ma2bT60d1oFYkxkTB
         26AxQ5fNMpo1pg3YSC07+L+pQxRUX8toQiA2bk7jB+VIy1EdXtBLMMeZzZDm1Z16VrHc
         PBGNHBOByc/ZCSRlxBdY2csNvZeGWQGiFfqUO4CblTjTSeA6Z66P7Mrs1sq7M0ClwbgX
         XTI4l41ZIEcT3aSse7iAYybD09DEEO+488M9q3jF9+mWFJhku09tdb11AUCbYVCi7Ymh
         Jiow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694438116; x=1695042916;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T2yRSNijSEry1q3t5KG0YspbSUTWaMB7q8b9zVPDgfQ=;
        b=fM1lusag/bqGss9RfbscnYw0OBeCWUQicEb38cCKv5wjmb1j3AipfFJxJbaBy3lICp
         jsfZYUhtG6RNQ+40JoCfoXoScWdpLG9slX4aTYzwr0jbrXrf5kS5Hklwdo+Kuqrxqajg
         JnsNG2bN2wGjJpbBne7OA7K4xjzBfQt4K1YQlZfxO5HATBE0IOqFkYeqO1lIf0PIiiWK
         EL+lOOMyPc1HQdlic4h8h24pzP+rkNs8UHSH7dacTLsxGA8yFFf10LWLEAX/iUF8ajS7
         9W8b9LiDAGEyy711QxDv0yb2yUclLwB+V+SpO2qL/t2CGMITzIDoLJMtOt+zlvubu6UM
         wjSA==
X-Gm-Message-State: AOJu0YwV1O6eSHcPxgo+TyeLY+SCzvjy8l0hnqy2h767TOApDTEltYDP
	COGNkiOwCU0Sm6AFg9sxX2o=
X-Google-Smtp-Source: AGHT+IELjlMzUCNKicXbgrdGNOE2IUiNXf+0+gLijFTkFHG5fABBFoZEs1wFcY4YX7BmQrH9l7MLTA==
X-Received: by 2002:a17:903:41c8:b0:1c0:c86a:5425 with SMTP id u8-20020a17090341c800b001c0c86a5425mr10229624ple.19.1694438116095;
        Mon, 11 Sep 2023 06:15:16 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id c5-20020a170902d90500b001b9ecee459csm6372378plz.34.2023.09.11.06.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 06:15:15 -0700 (PDT)
Message-ID: <d3c32833-72c3-f10c-bdb1-52de90eb90c7@gmail.com>
Date: Mon, 11 Sep 2023 20:14:55 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 00/17] Add Qualcomm Minidump kernel driver related
 support
Content-Language: en-US
To: Mukesh Ojha <quic_mojha@quicinc.com>, corbet@lwn.net, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
 mathieu.poirier@linaro.org, catalin.marinas@arm.com, will@kernel.org,
 linus.walleij@linaro.org, andy.shevchenko@gmail.com, vigneshr@ti.com,
 nm@ti.com, matthias.bgg@gmail.com, kgene@kernel.org,
 alim.akhtar@samsung.com, bmasney@redhat.com, quic_tsoni@quicinc.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, kernel@quicinc.com
References: <1694290578-17733-1-git-send-email-quic_mojha@quicinc.com>
 <ZP7VPfVtvbmB5aQf@debian.me>
 <c52e90e4-cab0-13b7-9658-1f730de6cf64@quicinc.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <c52e90e4-cab0-13b7-9658-1f730de6cf64@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_061521_946886_16B002B6 
X-CRM114-Status: GOOD (  34.36  )
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

On 11/09/2023 17:39, Mukesh Ojha wrote:
> 
> 
> On 9/11/2023 2:22 PM, Bagas Sanjaya wrote:
>> On Sun, Sep 10, 2023 at 01:46:01AM +0530, Mukesh Ojha wrote:
>>> Hi All,
>>>
>>> This is to continuation from the conversation happened at v4
>>>
>>> https://lore.kernel.org/lkml/632c5b97-4a91-c3e8-1e6c-33d6c4f6454f@quicinc.com/
>>>
>>> https://lore.kernel.org/lkml/695133e6-105f-de2a-5559-555cea0a0462@quicinc.com/
>>>
>>> We have put abstract on LPC on this topic as well as initiated a mail thread
>>> with other SoC vendors but did not get much traction on it.
>>>
>>> https://lore.kernel.org/lkml/0199db00-1b1d-0c63-58ff-03efae02cb21@quicinc.com/
>>>
>>> We explored most of possiblity present in kernel to address this issue[1] but
>>> solution like kdump/fadump does not seems safe/secure/performant from our
>>> perspective.
>>>
>>> Hence, with this series we tried to make the minidump kernel driver, simple
>>> and tied with pstore frontends, so that it collects the present available
>>> frontends data like dmesg, ftrace, pmsg, ftrace., Also, we will be working
>>> towards enhancing generic pstore to capture more debug data which will be
>>> helpful for first hand of debugging that can benefit both other pstore users
>>> as well as us as minidump users.
>>>
>>> One of the proposal made here,
>>> https://lore.kernel.org/lkml/1683561060-2197-1-git-send-email-quic_mojha@quicinc.com/
>>>
>>> Looking forward for your comments.
>>>
>>> Thanks,
>>> Mukesh
>>>
>>> [1]
>>> Minidump is a best effort mechanism to collect useful and predefined data
>>> for first level of debugging on end user devices running on Qualcomm SoCs.
>>> It is built on the premise that System on Chip (SoC) or subsystem part of
>>> SoC crashes, due to a range of hardware and software bugs. Hence, the
>>> ability to collect accurate data is only a best-effort. The data collected
>>> could be invalid or corrupted, data collection itself could fail, and so on.
>>>
>>> Qualcomm devices in engineering mode provides a mechanism for generating
>>> full system ramdumps for post mortem debugging. But in some cases it's
>>> however not feasible to capture the entire content of RAM. The minidump
>>> mechanism provides the means for selecting which snippets should be
>>> included in the ramdump.
>>>
>>> The core of SMEM based minidump feature is part of Qualcomm's boot
>>> firmware code. It initializes shared memory (SMEM), which is a part of
>>> DDR and allocates a small section of SMEM to minidump table i.e also
>>> called global table of content (G-ToC). Each subsystem (APSS, ADSP, ...)
>>> has their own table of segments to be included in the minidump and all
>>> get their reference from G-ToC. Each segment/region has some details
>>> like name, physical address and it's size etc. and it could be anywhere
>>> scattered in the DDR.
>>>
>>> Existing upstream Qualcomm remoteproc driver[1] already supports SMEM
>>> based minidump feature for remoteproc instances like ADSP, MODEM, ...
>>> where predefined selective segments of subsystem region can be dumped
>>> as part of coredump collection which generates smaller size artifacts
>>> compared to complete coredump of subsystem on crash.
>>>
>>> [1]
>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/remoteproc/qcom_common.c#n142
>>>
>>> In addition to managing and querying the APSS minidump description,
>>> the Linux driver maintains a ELF header in a segment. This segment
>>> gets updated with section/program header whenever a new entry gets
>>> registered.
>>>
>>> Changes in v5:
>>>   - On suggestion from Pavan.k, to have single function call for minidump collection
>>>     from remoteproc driver, separated the logic to have separate minidump file called
>>>     qcom_rproc_minidump.c and also renamed the function from qcom_minidump() to
>>>     qcom_rproc_minidump(); however, dropped his suggestion about rework on lazy deletion
>>>     during region unregister in this series, will pursue it in next series.
>>>
>>>   - To simplify the minidump driver, removed the complication for frontend and different
>>>     backend from Greg suggestion, will pursue this once main driver gets mainlined.
>>>
>>>   - Move the dynamic ramoops region allocation from Device tree approach to command line
>>>     approch with the introduction command line parsing and memblock reservation during
>>>     early boot up; Not added documentation about it yet, will add if it gets positive
>>>     response.
>>>
>>>   - Exporting linux banner from kernel to make minidump build also as module, however,
>>>     minidump is a debug module and should be kernel built to get most debug information
>>>     from kernel.
>>>
>>>   - Tried to address comments given on dload patch series.
>>>
>>> Changes in v4: https://lore.kernel.org/lkml/1687955688-20809-1-git-send-email-quic_mojha@quicinc.com/
>>>   - Redesigned the driver and divided the driver into front end and backend (smem) so
>>>     that any new backend can be attached easily to avoid code duplication.
>>>   - Patch reordering as per the driver and subsystem to easier review of the code.
>>>   - Removed minidump specific code from remoteproc to minidump smem based driver.
>>>   - Enabled the all the driver as modules.
>>>   - Address comments made on documentation and yaml and Device tree file [Krzysztof/Konrad]
>>>   - Address comments made qcom_pstore_minidump driver and given its Device tree
>>>     same set of properties as ramoops. [Luca/Kees]
>>>   - Added patch for MAINTAINER file.
>>>   - Include defconfig change as one patch as per [Krzysztof] suggestion.
>>>   - Tried to remove the redundant file scope variables from the module as per [Krzysztof] suggestion.
>>>   - Addressed comments made on dload mode patch v6 version
>>>     https://lore.kernel.org/lkml/1680076012-10785-1-git-send-email-quic_mojha@quicinc.com/
>>>
>>> Changes in v3: https://lore.kernel.org/lkml/1683133352-10046-1-git-send-email-quic_mojha@quicinc.com/
>>>   - Addressed most of the comments by Srini on v2 and refactored the minidump driver.
>>>      - Added platform device support
>>>      - Unregister region support.
>>>   - Added update region for clients.
>>>   - Added pending region support.
>>>   - Modified the documentation guide accordingly.
>>>   - Added qcom_pstore_ramdump client driver which happen to add ramoops platform
>>>     device and also registers ramoops region with minidump.
>>>   - Added download mode patch series with this minidump series.
>>>      https://lore.kernel.org/lkml/1680076012-10785-1-git-send-email-quic_mojha@quicinc.com/
>>>
>>> Changes in v2: https://lore.kernel.org/lkml/1679491817-2498-1-git-send-email-quic_mojha@quicinc.com/
>>>   - Addressed review comment made by [quic_tsoni/bmasney] to add documentation.
>>>   - Addressed comments made by [srinivas.kandagatla]
>>>   - Dropped pstore 6/6 from the last series, till i get conclusion to get pstore
>>>     region in minidump.
>>>   - Fixed issue reported by kernel test robot.
>>>
>>> Changes in v1: https://lore.kernel.org/lkml/1676978713-7394-1-git-send-email-quic_mojha@quicinc.com/
>>>
>>> Testing of the patches has been done on sm8450 target after enabling config like
>>> CONFIG_PSTORE_RAM and CONFIG_PSTORE_CONSOLE and once the device boots up.
>>>
>>>   echo mini > /sys/module/qcom_scm/parameters/download_mode
>>>
>>> Try crashing it via devmem2 0xf11c000(this is known to create xpu violation and
>>> and put the device in download mode) on command prompt.
>>>
>>> Default storage type is set to via USB, so minidump would be downloaded with the
>>> help of x86_64 machine (running PCAT tool) attached to Qualcomm device which has
>>> backed minidump boot firmware support.
>>>
>>> This will make the device go to download mode and collect the minidump on to the
>>> attached x86 machine running the Qualcomm PCAT tool(This comes as part Qualcomm
>>> package manager kit).
>>>
>>> After that we will see a bunch of predefined registered region as binary blobs files
>>> starts with md_* downloaded on the x86 machine on given location in PCAT tool from
>>> the target device, more about this can be found in qualcomm minidump guide patch.
>>>
>>
>> I tried to apply this series on top of 535a265d7f0dd50 (as suggested by
>> `b4 am -l -g`), but it conflicts on patch [04/17]. Please specify the
>> exact base commit or another series for which this series is based on.
> 
> Apologies !
> I just realized, it was 6.5-rc7, but let me rebase version of the series;
> 
> Sorry, for all the reviewed done so far, i will definitely take care of them or reply.
> 

OK, see you in v6!

-- 
An old man doll... just what I always wanted! - Clara


