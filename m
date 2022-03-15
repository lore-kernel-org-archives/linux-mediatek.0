Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71399C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 06:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W76BK02gbdAnVaNaqZ9xOc1nNgJxkG+Gpb3nnCNIZ6A=; b=1BLFnXLQRU7A3Q
	izJPPs56dlMzGtpzDhNAn9ts1XqPsnzz2H8e53hBErY9CZSREzShCJxlGq04WjJprpKYjuO/wRWkg
	NhHJDO8J2IiMNI82JkDtMWsw5eIotU7TuTIiGtBijmg2cmvNmBik+mHBFR242BbcOoHEQ6K5M1Fvb
	yIrppFhZ3xmN64VSUdNSV5NwZU6YcgL8o0a9zNzlWgEcKwWBWqPTJIPWJZe/Rb4G6MtIj84GZ2UTT
	X9WTIZa21YICA856XoLkeXvOAfp/n9ZPT78FKBw6Kukq0KCB1CtwddEvAilEM5/6DYUYLR6bpB0Bz
	RrlYyujOj+iEI5qbz9ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU0Ng-007uab-QK; Tue, 15 Mar 2022 06:10:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU0Nf-007uZu-G7
 for linux-mediatek@bombadil.infradead.org; Tue, 15 Mar 2022 06:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=F+cbAGYnny0iSeDsc7twzJUA2Syx+pyIyz+9xYL+xBE=; b=TPFKAHmDGJuYksVthp73wlZMSN
 Nii+SQy4CkInWuUt4iYCJXTjiW+2wlxlepfcCBB8bYy4qfa9DBY5ovthyM0lkbw5dNS24/M26BJMF
 RLljkiRFNlR94afap8CN/1zvhVenYvePd9OZcirma0A15xawuIn6x7lFKdgiFoLDtczSr/n9ouveL
 Y0PPuXw/Rjzqg3KzJTHZWgu/N34GWqmAe4s/zNLg1xWyI+q7qj7g+zewikM+ciNWNCuJHJBKhAPKO
 h7cREMN6MMSY096pNMiw0swY3IA170FxoblmubuwVNcGC/P+FRaQnAWnl+khhnIWtYt4TGJQNAMIJ
 rdozTOsw==;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTzLd-0016Vy-1x
 for linux-mediatek@lists.infradead.org; Tue, 15 Mar 2022 05:03:56 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22F3O8im008016; 
 Tue, 15 Mar 2022 05:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2021-07-09;
 bh=F+cbAGYnny0iSeDsc7twzJUA2Syx+pyIyz+9xYL+xBE=;
 b=nLE45LPef2Fzx4rwPHxO9zpKsqEtIiWTbgmRqQ1qVHlzXCQZCeRMa1v2iwMrs8kePxKm
 gVUKGAdAHvtD1zOTRy9LY1+u2pU8VgIF4l+P0YzhfQ3uL6rG6TExROKOc81sBEhsDd2B
 VJu1GUeogkty7qGjOl/d9vIciwL2kcr0/hsDhAtv4D5XCBy+dskdbsnEC/W63oGf/CHN
 99/QtLKCJ8vc2ShmZ+w8yH1KgM8Bx5WiYr6uNk22GOJe15nP8yE9COJqZgvSeoS+qTE5
 ZVdj04WClTGuNTQbJ/WidmWT/7WC93vboeKNQDgum6VlXcH1GEUVofmnXUd8TclPk03i bQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et5s6j20g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Mar 2022 05:02:43 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 22F51JJk004866; Tue, 15 Mar 2022 05:02:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3erhy25wv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Mar 2022 05:02:42 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 22F52cq7007094;
 Tue, 15 Mar 2022 05:02:41 GMT
Received: from ca-mkp.mkp.ca.oracle.com (ca-mkp.ca.oracle.com [10.156.108.201])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3erhy25wts-3; Tue, 15 Mar 2022 05:02:41 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, jejb@linux.ibm.com, peter.wang@mediatek.com,
 avri.altman@wdc.com, alim.akhtar@samsung.com, stanley.chu@mediatek.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com,
 chaotian.jing@mediatek.com, beanhuo@micron.com,
 wsd_upstream@mediatek.com, alice.chao@mediatek.com,
 jiajie.hao@mediatek.com, powen.kao@mediatek.com, cc.chou@mediatek.com,
 mikebi@micron.com, qilin.tan@mediatek.com, lin.gui@mediatek.com
Subject: Re: [PATCH v1] scsi: ufs: scsi_get_lba error fix by check cmd opcode
Date: Tue, 15 Mar 2022 01:02:33 -0400
Message-Id: <164732052814.23186.8418060830463850785.b4-ty@oracle.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220307111752.10465-1-peter.wang@mediatek.com>
References: <20220307111752.10465-1-peter.wang@mediatek.com>
MIME-Version: 1.0
X-Proofpoint-GUID: CGHBTJI2hPrbY2UpGNc2X2W0cgtXK5GY
X-Proofpoint-ORIG-GUID: CGHBTJI2hPrbY2UpGNc2X2W0cgtXK5GY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_050353_740815_15059AB8 
X-CRM114-Status: GOOD (  11.86  )
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

On Mon, 7 Mar 2022 19:17:52 +0800, peter.wang@mediatek.com wrote:

> From: Peter Wang <peter.wang@mediatek.com>
> 
> When ufs init without scmd->device->sector_size set,
> scsi_get_lba will get a wrong shift number and ubsan error.
> shift exponent 4294967286 is too large for 64-bit type
> 'sector_t' (aka 'unsigned long long')
> Call scsi_get_lba only when opcode is READ_10/WRITE_10/UNMAP.
> 
> [...]

Applied to 5.18/scsi-queue, thanks!

[1/1] scsi: ufs: scsi_get_lba error fix by check cmd opcode
      https://git.kernel.org/mkp/scsi/c/2bd3b6b75946

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
