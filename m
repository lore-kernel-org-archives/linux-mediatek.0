Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43441C4741F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 09:47:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B72A62076E
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 09:47:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rjTxMV2Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="s28uOHgQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B72A62076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Fzx6aOPLeEdWd5974Bq1WYY0reJkMo/xHBilZy0g1+8=; b=rjTxMV2Yv+eGotk8VTT0bRyBU
	GfXpsAYUYI+6ePrBWkndMhRGQWzbvVQ2z1e9O9035Liujf1JxODM+QHuCWcCpF2b0gI/9Yw1tPRuw
	26XHVDfJz31sCbwnZqZP8zlc/Ma4T8Wb7TpZ9lFsYR9Skl2GaiM3GGBWS4/yF7GjJcrnIx2ReG8DJ
	9wCXRor0CDAo77Fepb15SFFrMIStX8Ds4/eC3EwL1iMi4olNO+l1AtabKYZAmY/k2lkG4+Vu3vKje
	s4zy5BpCEFug6o8dp9mK0LbB0rSmJJefZ2KloWdq5g0twA2xa9aKdVim7A2x/nsc76pl7yX968+aW
	Vpo18tvgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYQzr-0004kU-AS; Fri, 30 Oct 2020 09:46:59 +0000
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYQzl-0004iN-8g; Fri, 30 Oct 2020 09:46:54 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id YQzdknX7BWvjMYQzgkGtCr; Fri, 30 Oct 2020 10:46:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1604051211; bh=Pdg2BqSmMwoZQGtV1iF1NAS1Qn9FHQFDjbWGQqM5wEs=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=s28uOHgQMtVsh/PbMfcJboYch0mb5dfZ4lF48s5NIPzrSEk7Rh3UM1DLA56IcyyzI
 eERaxLiB+1UEdyS/IX6M0g+IXuDGQX8sAc3f5cx3GOnObgGFt1J+flwrefc/EuuhWk
 ioVozMuSHDq0ntEH0vANjjCq7WkB+DuVgyKSJosTBGeafFTI/v/3910KLJSBZyCCIf
 /Ui3TXWCRRZcKo4DIAMPt1qB6QRmQRg3xsD9ICvOajIo8Y8WohafKPRfxUZYre2FcM
 +QSIEpsTiGHGr5DBwq2h4dI4s2HmnL3ZwgT81ozfSDLDHMF6bSD/Q7n+NzuFWqb2CV
 stgWBd8p0ukVw==
Subject: Re: [PATCH 2/7] media: platform: add missing put_device() call in
 mtk_jpeg_probe()
To: Yu Kuai <yukuai3@huawei.com>, rick.chang@mediatek.com,
 bin.liu@mediatek.com, mchehab@kernel.org, matthias.bgg@gmail.com,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, tfiga@chromium.org,
 xia.jiang@mediatek.com, jcliang@chromium.org, minghsiu.tsai@mediatek.com
References: <20201009123804.3977562-1-yukuai3@huawei.com>
 <20201009123804.3977562-3-yukuai3@huawei.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <4644b6ca-ecc9-191f-c335-9c6d692ef38c@xs4all.nl>
Date: Fri, 30 Oct 2020 10:46:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201009123804.3977562-3-yukuai3@huawei.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfHRSTXX2tuyjvrOe6szrQWoPECst5NygCfNPSzfWeuxB6owGDckhCYt7ROxCi6fE4GH2b/zI31EQ3ecHOlG/HAsYzCJbkBD++ECkCiZH2wC8ivZ1kvgC
 rFR1Cj+Y4LDNG4b9t2zP6ATQcGnbLn0Y53g+vlHsMUF6uk8n9p1vGsTcBHMwDvTYNUJCWNsobZI39NAfp9iqIrIxWUwOZnPMynjboXd4EucdEppyb10Z6mc9
 ErsFjjDPlgGgliU3ihqUP7zDu1iEtVgbt/tY0GQR9Tm6ppPmf/jazvLYXvi0QIxJNdZrbAtUo+X98xORM3XCJpbQ+icohzGoT9x9PQHX0ga60XkxHJz6+/Pv
 WnIwJVETnBqa6k5zGkcktsz1AS2x7boco9WAO9uioalVYyrjV4uafPdbDYoJrottRlSnwoBrijQJlsyHhDti6gny3CzyyzE/pPSUv4lssas+mOehkW+3upe4
 dmEbMv6IBKX28Hz6tgpfQXP7WoB1bx/Kls5pr5DIjfFx/ZdQl85CmNcb0pRKy+CRnig9aOb7S9IqdwPEQMWixiorejCTjxvmiWL2RQWgEvAVPGs8rvxfdeLA
 fZm+IPtCkMbB6v1NzlN/Xv0VMtvTpS7dMNrDIHyzNKRqpKFZw4Q4eBigQrSnLKizV1pRRB4ZgqatKqymeeP2X92I320AuKDtZQDigqdhiDf8OV91AKif+MzV
 ZcmfD2dAsyfqreuwYbX8mPy/UVRG8aLwOycfJ7i832ZvXPqAs7z+QA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_054653_436884_418A0E53 
X-CRM114-Status: GOOD (  18.22  )
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
Cc: yi.zhang@huawei.com, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 09/10/2020 14:37, Yu Kuai wrote:
> if mtk_jpeg_clk_init() succeed, mtk_jpeg_probe() doesn't have a
> corresponding put_device(). Thus add put_device() in jump target to fix
> the exception handling for this function implementation.
> 
> Fixes: b2f0d2724ba4 ("[media] vcodec: mediatek: Add Mediatek JPEG Decoder Driver")
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index 106543391c46..f0c412f96d61 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -1436,6 +1436,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>  	v4l2_device_unregister(&jpeg->v4l2_dev);
>  
>  err_dev_register:
> +	put_device(jpeg->larb);
>  
>  err_clk_init:
>  
> 

This is too confusing since it is not obvious that this is the
counterpart of mtk_jpeg_clk_init. I think it would be much easier
to understand if you add a mtk_jpeg_clk_release() which does this
put_device, and call that new function both here and in mtk_jpeg_remove().

Regards,

	Hans

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
