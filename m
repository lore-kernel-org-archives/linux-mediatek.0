Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A75C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Nov 2023 19:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+32vB581hzmFY06dbkkG5Ku+sXQfolP2uRxPBBpw/0=; b=0LtY7kYZBrYfkrD1cNvWCysLDx
	5tliUtsqkObfDtOHe/PL5D8a4zFnvXAm5fIDn9Cvf0ciGIdr0XwagwqpKd/KaUUXltvQVP/1lyn8M
	KR2OLYt0Clhv1em8Ij+f5r+ak8VLE+VgtZk9B3WrccksmkkRQ73s+BY/4qhpSBuMOgcUSJXLjWB45
	BQNIv/A0YoiIak3NStQqWCf9nQxBYHMZvvONh0ZMyQ5WAYs4XUcgIMa3/04AeKvAGrNib/C1rjBVS
	ZlIdg+OqPZfCxLbqbHX39GGCALdVTrj2xAvCiHSq5Lp3vRlVf7qsbLpOn0q2314TfFxFmei/YuVz6
	3MJPKr1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qydAK-00A9IY-2N;
	Thu, 02 Nov 2023 19:15:40 +0000
Received: from mail-pl1-f176.google.com ([209.85.214.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qydAG-00A9Hh-2t;
	Thu, 02 Nov 2023 19:15:38 +0000
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1cc29f39e7aso10325185ad.0;
        Thu, 02 Nov 2023 12:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698952533; x=1699557333;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U+32vB581hzmFY06dbkkG5Ku+sXQfolP2uRxPBBpw/0=;
        b=DuPoCvPQQvi/yXy60aT9pbYf37FUqqYoIaImcL2bRZZpEvi+hUlzqou/orSfRqfFgI
         QA+Q079IEu/8MLNBescSVcjbjyUMyL/BT1r2YLIIOScZEHoUH76XiTIt58IHcLNJtfFc
         p8IhHu/Vgch73dJRXLBMMlWgOHK3EatRkXNyDAmjl8JopAwflyfbIiVBNUaDiXSbpf6C
         iys11Qd0vHogO6HJHVACz5lQWWUot/QYjQMi001ZkwdI+LP1dIR9y/faWF6wjM+jnVnP
         97tqPQyuea+Bvh6489uQ04rqmA4nmq5coUWTATv0XdHnvSkznCE5lrsu06/xaaidDH6/
         ouRw==
X-Gm-Message-State: AOJu0YzNWLr5iu0VxZyhDdcH8wuu7YdpM5PiVcCasMxasiXVMztKq7L6
	cnS4MxPiCwVg4pwfhWvHzxc=
X-Google-Smtp-Source: AGHT+IFyB05wi+a/eG/YQ1Na65WBGYrjXb0/KwBD8cobt8pwQS6rMJJxY+nlRQqkNhMEnWdm3gsKhQ==
X-Received: by 2002:a17:902:ea01:b0:1cc:47a6:12b8 with SMTP id s1-20020a170902ea0100b001cc47a612b8mr14760705plg.46.1698952533338;
        Thu, 02 Nov 2023 12:15:33 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:87f7:9784:4475:1cd4? ([2620:15c:211:201:87f7:9784:4475:1cd4])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902744500b001c60ba709b7sm80157plt.125.2023.11.02.12.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 12:15:32 -0700 (PDT)
Message-ID: <64a6315d-76df-49c8-aa57-a0576c53b6ef@acm.org>
Date: Thu, 2 Nov 2023 12:15:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] ufs: core: Expand MCQ queue slot to
 DeviceQueueDepth + 1
Content-Language: en-US
To: Manivannan Sadhasivam <mani@kernel.org>, naomi.chu@mediatek.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Asutosh Das <quic_asutoshd@quicinc.com>, Can Guo <quic_cang@quicinc.com>,
 wsd_upstream@mediatek.com, peter.wang@mediatek.com, casper.li@mediatek.com,
 powen.kao@mediatek.com, alice.chao@mediatek.com, chun-hung.wu@mediatek.com,
 cc.chou@mediatek.com, eddie.huang@mediatek.com
References: <20231102052426.12006-1-naomi.chu@mediatek.com>
 <20231102052426.12006-2-naomi.chu@mediatek.com>
 <20231102163728.GB20943@thinkpad>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20231102163728.GB20943@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_121536_931500_0C36B8CE 
X-CRM114-Status: UNSURE (   6.55  )
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

On 11/2/23 09:37, Manivannan Sadhasivam wrote:
> Where is the changelog?

I think it's here: 
https://lore.kernel.org/linux-scsi/20231102052426.12006-1-naomi.chu@mediatek.com/

Bart.


