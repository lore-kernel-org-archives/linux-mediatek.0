Return-Path: <SRS0=ZAsA=HL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB55C433E6
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 09:20:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EFC464EB4
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 09:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EFC464EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d+uTiKdD7C3k8TPxPVW/mUCn+FFxLlAuWSoT7OkWSgY=; b=tJXq4QZng5zV7TbuwfBchH2iv
	/nOxAp82cB82uRLjIXq1QgxYMX7+iP1MjKJrEf9haBd7LBH4nVKv7QHGKn6vYeIh99fJEMjsaoSKh
	X+FeeKpBbJxaeTYhmHv/e5ciqNrXRf8mw8dt/E2W9QiHpRVGyBbGoRbwFyBsPdXQymVNpWDR78xsj
	CkZdK55xeg1LJl1NMVQ2fzhICIJSHkdGCuuCPIuv7eizHDgGVWjRizNgT0DpFDU0vublbbgGlqRa9
	TJMrDZGxar3rPUO0EztlIe52QQajQYog7tldkeajnHA/GDIUND2O87ZkeNnopbAbrH+rSAKef86Oo
	o1sJBf5JQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9PBa-000461-IA; Tue, 09 Feb 2021 09:19:54 +0000
Received: from aserp2130.oracle.com ([141.146.126.79])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9PBX-00044i-HS; Tue, 09 Feb 2021 09:19:52 +0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1199ALen133205;
 Tue, 9 Feb 2021 09:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=eAlfirjFPihoK/mVAVic9Bz9nKfTspoU2b002Thx3AM=;
 b=YEOpzUrNhfU54eiph6icmJICKD5YX/bSS/aQx2vG2VNy/Y+oGw8692bvsVrFesi/cNBJ
 +ZfQStgtjYGtYbatqd1sydNzQ+bLgb46Dh1rmrvaQVtS+nE+VQwe3ncX6V6UK6ENz/S1
 +KVR7R3hhXwVqXXup+VRoZXYNBdqtBOL4I13sQ1u8wGjViH0WDLWZ18AfMC+02K3L9KK
 PpJgHCxY2su25D9Hgqb5zIUueQOS5z1JqFLUeyaKwbQrLxrQKKiIAvQpeRJUA+nk+r0e
 IXCDbMH+di0ydphrfDjmOFL3IePLO6QyaaDth4STzDLTr1fGEAeW1nqXcmkLw7E6VeGG MA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 36hgmaeweh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Feb 2021 09:19:38 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1199BNCv091397;
 Tue, 9 Feb 2021 09:19:36 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 36j510y9wm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Feb 2021 09:19:36 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 1199JXkl007635;
 Tue, 9 Feb 2021 09:19:34 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 09 Feb 2021 01:19:33 -0800
Date: Tue, 9 Feb 2021 12:19:23 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH][next] iommu/mediatek: Fix unsigned domid comparison with
 less than zero
Message-ID: <20210209091923.GO2696@kadam>
References: <20210203135936.23016-1-colin.king@canonical.com>
 <20210204092558.GA20244@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204092558.GA20244@willie-the-truck>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102090045
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 clxscore=1011 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102090045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_041951_757295_F5365C5C 
X-CRM114-Status: GOOD (  27.92  )
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
Cc: Anan sun <anan.sun@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, Chao Hao <chao.hao@mediatek.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Colin King <colin.king@canonical.com>, Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 04, 2021 at 09:25:58AM +0000, Will Deacon wrote:
> On Wed, Feb 03, 2021 at 01:59:36PM +0000, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Currently the check for domid < 0 is always false because domid
> > is unsigned.  Fix this by making it signed.
> > 
> > Addresses-CoverityL ("Unsigned comparison against 0")
> 
> Typo here ('L' instead of ':')
> 
> > Fixes: ab1d5281a62b ("iommu/mediatek: Add iova reserved function")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/iommu/mtk_iommu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 0ad14a7604b1..823d719945b2 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -640,7 +640,7 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
> >  				       struct list_head *head)
> >  {
> >  	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
> > -	unsigned int domid = mtk_iommu_get_domain_id(dev, data->plat_data), i;
> > +	int domid = mtk_iommu_get_domain_id(dev, data->plat_data), i;
> 
> Not sure if it's intentional, but this also makes 'i' signed. It probably
> should remain 'unsigned' to match 'iova_region_nr' in
> 'struct mtk_iommu_plat_data'.


iova_region_nr is either 1 or 5 so unsigned doesn't matter.

I once almost introduced a bug where the iterator was supposed to be
size_t.  I fixed a bug by making it signed but I ended up introducing a
new bug.  But generally that's pretty rare.  The more common case is
that making iterators unsigned introduces bugs.

It's better to default to "int i;" and if more complicated types are
required that should stand out.  "size_t pg_idx;" or whatever.

regards,
dan carpenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
