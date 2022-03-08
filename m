Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9ED8C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 22:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2otmKkjmAc5s+A6c5rTjjBiRw9h4sRyYl1EnsyUGTq0=; b=tpTnMJCtKxNv7/
	G+NSXziAsaC9ZIGJEBcsBHzxgyfn0ChR79oXS0m0feXR7K7TXSJhkmUj2ZdQQCoNCAVE5dJRaVH8j
	bOJMzCMJFALaPwWRDGEaCp2dAoE8BhUvepu2rb/chyr3cK1RnqAXWQpxj7gnx4umAovGgJgTzm8R1
	uX+SU1YxaIjKca8nqWFl2dRWzQ7FrWQhUgMBH7XQcYg8hBNmJ+UqLeytt+TYRIeQ3moRXtfwcN5OO
	Epbk6cQZ0AFsrzRJjxWAhlZvU/UJVu4p4JQADf2EfmvCSmoqFtb+Cjr0oXlWgs5Op+siD8Hc+ORfv
	9NR7Gdy+xyy4ZepEDd3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRi3W-006Q3K-J7; Tue, 08 Mar 2022 22:11:46 +0000
Received: from mail-pj1-f47.google.com ([209.85.216.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRi3U-006Q2T-0G
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 22:11:45 +0000
Received: by mail-pj1-f47.google.com with SMTP id bx5so594667pjb.3
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Mar 2022 14:11:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zsuN6YZ8l60CNL3ec8tnGiB7TFkpcMErgCfCkAo2B4I=;
 b=Zo5XU5DnSPP3Zyeej6ngqAZ6p+f9i4lBUz7gcvbC0KblB0ZnV8z7xTUgX/3omcwIsr
 84Z5jQIWYjsXjHapmxgShHx5srqvpk1OR7u+orTjlNQlxgTLvS6Mo6vjpQ/yklMVq0Vb
 I8WfeDLzNK52jv2WlFAn692JVSnv4+sf36bHgOCXwMa59kt6Z0Tld3xb8aY+VrhzMuYX
 MkWCBhRh+VG4+2B1ZeslWeM5v/WAZiAPam/E/CSnN91StyBTF3L9ML4vPO2wzmJbiIeo
 JMYwP34kkhwAgs53fDXab7nEie2CTxhqnjtZOUPjuZ/nuLYXzn6W0507VYnd3aLGizrA
 PYNA==
X-Gm-Message-State: AOAM530gXuwlSpno6E5JMXpeAkYc5Rj0bEh4P//Tz+s0UF34NPVBfQ5D
 VZy2X5AcANtbL5I/KOXlKeg=
X-Google-Smtp-Source: ABdhPJwy/p0tWeBMYKahZbXIxu9gJnAw5AeTU3wvkcEtpbhfcyhI3vDafIBBiSgYY92GvI/w0YJzLg==
X-Received: by 2002:a17:90a:bf91:b0:1b9:bda3:10ff with SMTP id
 d17-20020a17090abf9100b001b9bda310ffmr6956053pjs.38.1646777502510; 
 Tue, 08 Mar 2022 14:11:42 -0800 (PST)
Received: from ?IPV6:2620:15c:211:201:88cc:528c:d341:9395?
 ([2620:15c:211:201:88cc:528c:d341:9395])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a056a00228600b004f709f5f3c1sm60541pfe.28.2022.03.08.14.11.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 14:11:42 -0800 (PST)
Message-ID: <4f464024-d114-dafb-8a0d-fa77c6fdd5d6@acm.org>
Date: Tue, 8 Mar 2022 14:11:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v1] scsi: ufs: scsi_get_lba error fix by check cmd opcode
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, mikebi@micron.com,
 beanhuo@micron.com
References: <20220307111752.10465-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220307111752.10465-1-peter.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_141144_102790_72543B7E 
X-CRM114-Status: UNSURE (   5.66  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 3/7/22 03:17, peter.wang@mediatek.com wrote:
> When ufs init without scmd->device->sector_size set,
> scsi_get_lba will get a wrong shift number and ubsan error.
> shift exponent 4294967286 is too large for 64-bit type
> 'sector_t' (aka 'unsigned long long')
> Call scsi_get_lba only when opcode is READ_10/WRITE_10/UNMAP.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
