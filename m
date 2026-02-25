Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51575FD45E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Feb 2026 19:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JP89OuauajIco858XJ7s3e3nA09LiU6G8dbnXGP3kNQ=; b=EmXNqZrRflkcBHfcmAaV79XLrf
	ibSIs/csbXhnKOkBGsZuvtSqIKuJ2Y+pOhhG1BxD9jTpYvEUWzea0f15anhnso6OMVqXJvt4GrLyz
	QZ+HgaePFKWoHVZanyCKpkqIepnN+VYJh2F2dTVAfy1UA3yKlVo8eH/GUI7l8dkL+89EfYeVm+BUr
	T7oGL+YQ3IOJiB5AFnmm3X0Lk2b+mF5I0yOweGtcWIe0kiJ4rd+/Z5Pi43IwuLxweJHFiCArOJPl2
	zk1LKsDjLTG48UtiqfooiTtaxKNT1N2P0sw0fGbEyis/+Ne4/NoAnC1avtjLO5Z6n9hLXQzRyYhkC
	GWlf30RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvKpJ-00000004oG4-3GhN;
	Wed, 25 Feb 2026 19:45:41 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvKpG-00000004oFf-3B0P
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Feb 2026 19:45:40 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4fLlSL17jFz1XM6J7;
	Wed, 25 Feb 2026 19:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1772048735; x=1774640736; bh=JP89OuauajIco858XJ7s3e3n
	A09LiU6G8dbnXGP3kNQ=; b=zSKxLKef2N8n8FXSoP2muNsXIFU0Xg2gg4w/qxOF
	haXU3AWn1G4111dTIMV8/9B6cU8BxTTf7btFKVE0ukzpAdFHov55bZUwHzkTsY3V
	hSFJT992uhXBAszCdsKBlCPPmquVD+yUms3oFhzTVuVmQV/Ke0X/8D/Iu+KJ5Gmv
	gu8AZTZKa8HCTbeXwDbiarDiZCD4wsscK+VcahRVMWR1N7DcKAB0QBJxg4cmSmAT
	4Gvu34SlvAYDyBGsnn8h8g2Zn7g+akx0YSqLURR1wzrYjH+ZXMVxGVj/fPpg84dp
	1M9VC2RSfE1ErA+4seTj5uowicxEknmM6jQvcrCjvDUmNw==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id d-03Ske_5TLB; Wed, 25 Feb 2026 19:45:35 +0000 (UTC)
Received: from [172.20.2.156] (unknown [4.28.11.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4fLlSB0jp4z1XM6J5;
	Wed, 25 Feb 2026 19:45:29 +0000 (UTC)
Message-ID: <b680084c-88b1-4854-981b-316311452e56@acm.org>
Date: Wed, 25 Feb 2026 11:45:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: Fix possible NULL pointer dereference in
 ufshcd_add_command_trace()
To: "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, avri.altman@sandisk.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com, peter.wang@mediatek.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com
References: <20260223065657.2432447-1-peter.wang@mediatek.com>
 <177198526950.1649777.14781899060414426367.b4-ty@oracle.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <177198526950.1649777.14781899060414426367.b4-ty@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_114538_869221_4E786C63 
X-CRM114-Status: UNSURE (   8.71  )
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

On 2/24/26 6:08 PM, Martin K. Petersen wrote:
> Applied to 7.0/scsi-fixes, thanks!
> 
> [1/1] ufs: core: Fix possible NULL pointer dereference in ufshcd_add_command_trace()
>        https://git.kernel.org/mkp/scsi/c/30df81f2228d
Hi Martin,

Do you agree that the following should be added to this patch?

Fixes: 4a52338bf288 ("scsi: ufs: core: Add trace event for MCQ")

 From commit 4a52338bf288:

@@ -456,9 +458,16 @@ static void ufshcd_add_command_trace(struct ufs_hba 
*hba, unsigned int tag,
         }

         intr = ufshcd_readl(hba, REG_INTERRUPT_STATUS);
-       doorbell = ufshcd_readl(hba, REG_UTP_TRANSFER_REQ_DOOR_BELL);
+
+       if (is_mcq_enabled(hba)) {
+               struct ufs_hw_queue *hwq = ufshcd_mcq_req_to_hwq(hba, rq);
+
+               hwq_id = hwq->id;
+       } else {
+               doorbell = ufshcd_readl(hba, 
REG_UTP_TRANSFER_REQ_DOOR_BELL);
+       }
         trace_ufshcd_command(dev_name(hba->dev), str_t, tag,
-                       doorbell, transfer_len, intr, lba, opcode, 
group_id);
+                       doorbell, hwq_id, transfer_len, intr, lba, 
opcode, group_id);
  }

Thanks,

Bart.


