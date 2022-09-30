Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB6FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 20:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60CrGrB0e6fs1uT+/qZjiXxM9X8SBAH3xk7kv3P7tIA=; b=IE0Row9UTJuCC2UHmNThW0HhJ/
	t4yOPaeschi3GBdCaTrYfd0w3HZu86+Ifbh9KYmZkd5t2XewoPk2Z5ei25fwip4kyuzPTgegQHgQK
	fAyzmbj+0tfGAHprXRd48evbjbFJa5lXi3G5G3QNAZVHOtcQPDMUl+V4Ti1+vyHOccx7pWediTxri
	RNxoFVQSnV6oEgosB+z1vbbltellznL7Ezx1iDq/BDlwd9KqHAZZ+VbPvEriKMMZAb9Ock1O9vrFA
	jL8pD664jZPj53eRgBiD8nuh4ZeQmmODnbStKNViON5JJwBzlZJ/Rq+1WnouC9LdZEz92H9sZXx7X
	Wvr8ouZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeMpR-00BScZ-4x; Fri, 30 Sep 2022 20:41:49 +0000
Received: from mail-pf1-f173.google.com ([209.85.210.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeMpG-00BSYC-5G; Fri, 30 Sep 2022 20:41:39 +0000
Received: by mail-pf1-f173.google.com with SMTP id d10so5210208pfh.6;
        Fri, 30 Sep 2022 13:41:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=60CrGrB0e6fs1uT+/qZjiXxM9X8SBAH3xk7kv3P7tIA=;
        b=lGMd4UflLo4nS4RdY1qFszN7hmfZ/1A004X1StLKElfLYNnndx4bL28f+q6OWr9C7Q
         vr+kqnxd9+vf7fK5g47abGft2NOoiciRQ/Mw44d3XfgP6YjSmWHYX/nRkjyv49PMUImT
         iVmJEP+Pp+4SMAiaxGjAFSEkbGAzrxQJ92BdwdJMkZPOeC57OCVd/JrE3yqG00NqSabJ
         KoGaAoge74V9VME3bAVIOi4j+qDTadg9GKlLkGnZ2SFDQX4oiQ1QIhYuuVAAyc2vLUD6
         Ms9s9TCOvsj72qVJ52J7b5TAhsy73gcIBgOC349L+vuAAoKp74+UiwxPtKPe9R0RP0R5
         Byog==
X-Gm-Message-State: ACrzQf2R3b0pVmCGfhI3McODNCqE0JCwIZK1uzXNEABz4n6szNj4t43K
	VhjBRu71/ufWw4kaYgcHn3I=
X-Google-Smtp-Source: AMsMyM5MYGchnh/5092UUxijYEqfRZb1CYA1EwF+TiolECUJn54DGNFvapBS5cLz3NzmwnxfgIr/cg==
X-Received: by 2002:a65:4303:0:b0:439:f026:ccee with SMTP id j3-20020a654303000000b00439f026cceemr9087282pgq.322.1664570495276;
        Fri, 30 Sep 2022 13:41:35 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:9b89:d9c:f74c:7711? ([2620:15c:211:201:9b89:d9c:f74c:7711])
        by smtp.gmail.com with ESMTPSA id m5-20020a170902db0500b0016d6c939332sm2283577plx.279.2022.09.30.13.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 13:41:34 -0700 (PDT)
Message-ID: <d0ce6b32-04ac-e3bc-d999-6a9c3d757645@acm.org>
Date: Fri, 30 Sep 2022 13:41:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 13/16] ufs: mcq: Add completion support of a cqe
Content-Language: en-US
To: Asutosh Das <quic_asutoshd@quicinc.com>, mani@kernel.org,
 quic_nguyenb@quicinc.com, quic_xiaosenh@quicinc.com, quic_cang@quicinc.com,
 quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com,
 quic_richardp@quicinc.com, stanley.chu@mediatek.com,
 adrian.hunter@intel.com, avri.altman@wdc.com, beanhuo@micron.com,
 martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kiwoong Kim <kwmad.kim@samsung.com>, open list
 <linux-kernel@vger.kernel.org>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <cover.1663894792.git.quic_asutoshd@quicinc.com>
 <80b24ce43aadac3bf561a60a65303f36ae8c0c21.1663894792.git.quic_asutoshd@quicinc.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <80b24ce43aadac3bf561a60a65303f36ae8c0c21.1663894792.git.quic_asutoshd@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_134138_228361_85E9494B 
X-CRM114-Status: GOOD (  11.09  )
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

On 9/22/22 18:05, Asutosh Das wrote:
> +static int ufshcd_mcq_get_tag(struct ufs_hba *hba,
> +				     struct ufs_hw_queue *hwq,
> +				     struct cq_entry *cqe)
> +{
> +	dma_addr_t dma_addr;
> +
> +	/* Bits 63:7 UCD base address, 6:5 are reserved, 4:0 is SQ ID */
> +	dma_addr = le64_to_cpu(cqe->command_desc_base_addr) & CQE_UCD_BA;
> +
> +	return (dma_addr - hba->ucdl_dma_addr) /
> +		sizeof(struct utp_transfer_cmd_desc);
> +}

Since the above code only works correctly if the size of struct 
utp_transfer_cmd_desc is a multiple of 1 << 7, please add a 
BUILD_BUG_ON() statement that verifies that the size of 
utp_transfer_cmd_desc is a multiple of 128.

Thanks,

Bart.

