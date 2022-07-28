Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B49C04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 18:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BcO9zWJV/5IIyHkNAzGcQRIZepKEay3HAgW3uDP3bO4=; b=lYm5l2+rcTwGdvSxsBn4TaES5+
	blAqMTY1pECjMdyq08PomsmOOBZxTnbINkPGtYSjcaiLb32fH/doh8C80YqaHGHSlVD3HUOVLZZwS
	C9nmC06a9UsN0p92o/f62LVJW8AAPoW8PDZP0kHutYUoV/Yss7MeAiy9CUCY3YlD0Acgcvz4Go8o7
	vA2g3wSbmidQ5JWo1m6TWPq6Mt6acTL+A/6n+XEU8sU4T9cAxQOAmiTjJsWWspWhsS8n4cz4yitG2
	sPEYgq0MV/GjusqmeBp3/6iFPUcVI3uC5wr+rTpPbSD9Lfu1xpoZuaal7ndo21vlQMI5xfcKdplci
	Ri9+1AAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH8EH-00D9nl-9k; Thu, 28 Jul 2022 18:27:25 +0000
Received: from mail-pj1-f43.google.com ([209.85.216.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH8EE-00D9nB-UT
	for linux-mediatek@lists.infradead.org; Thu, 28 Jul 2022 18:27:24 +0000
Received: by mail-pj1-f43.google.com with SMTP id y1so2560752pja.4
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Jul 2022 11:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BcO9zWJV/5IIyHkNAzGcQRIZepKEay3HAgW3uDP3bO4=;
        b=ipMLfFdYKGXfDFZXKGqneDsruMdo1k21CMpxhuiae+Mpe8yc7ORvnpRbiP2eAmE8Xr
         M+EEzW532bo2C6lFmqoOPzqSs9lx1dnl/HjWx19TMo1AYFC8PdZDnl30VXD4zBPWQsNa
         MmLDTy4MkjPLjc2JOoJ3fYsuqugqQ6dMVjI/j4xVfn36UoLivfdbX9Juyk4hPtwWkla2
         nzhxVJrNwAXAYA3Ql7/I1TbvBQbzTzGqn+usJuMsCB8TQD0AP4tbLnqexjIvTx/eOMYp
         oui/hJvt/4OR3A1MA8NOJs4qdwdP9JSiZox85YxwzQlJAPUl0GVkrRVScNdAuKLlJDDl
         2b6A==
X-Gm-Message-State: ACgBeo1wxaoOS3PYq9yC/2+BvDBRd7dVfvZMJhkYt7jfnsFeZusoLP/z
	q2Pjul14vJocyH5RxPdEA/Q=
X-Google-Smtp-Source: AA6agR5UvcsZRci6YYhjar/7IaAFMMqondM4nB22m0cab+nGstuwrbBojrS830efi/1BOuZWDL9zGg==
X-Received: by 2002:a17:902:7c05:b0:16d:2c63:da90 with SMTP id x5-20020a1709027c0500b0016d2c63da90mr204105pll.27.1659032841845;
        Thu, 28 Jul 2022 11:27:21 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:9520:2952:8318:8e3e? ([2620:15c:211:201:9520:2952:8318:8e3e])
        by smtp.gmail.com with ESMTPSA id y10-20020a62640a000000b0052c849d0886sm1101263pfb.86.2022.07.28.11.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 11:27:21 -0700 (PDT)
Message-ID: <c70d8e24-d46a-560e-ad12-49160c8ffa29@acm.org>
Date: Thu, 28 Jul 2022 11:27:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4] ufs: core: fix lockdep warning of clk_scaling_lock
Content-Language: en-US
To: Peter Wang <peter.wang@mediatek.com>, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, stable@vger.kernel.org
References: <20220727032110.31168-1-peter.wang@mediatek.com>
 <5fab3d4f-914e-63f8-a3e8-7dd92ecdb04a@acm.org>
 <47d1efed-69a7-cabf-e586-48b09a9afd78@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <47d1efed-69a7-cabf-e586-48b09a9afd78@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_112723_010012_146FED25 
X-CRM114-Status: UNSURE (   7.20  )
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

On 7/28/22 00:13, Peter Wang wrote:
> Maybe we can have another choice, let vendor decide ufshcd_wb_toggle 
> with clock scaling or not?

I prefer that this code behaves identical for all UFS host controllers 
and all UFS devices. Making this code behave different per vendor would 
make it harder to read and to verify this code.

Thanks,

Bart.

