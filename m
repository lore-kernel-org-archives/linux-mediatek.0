Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5EB606A31A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2026 04:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nWVvab8/;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nnTjRJJF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=70j/JPno7B9xtvcJSe+D2llozuMkyOhwkjeWL10j++0=; b=nWVvab8/QSQUG3mk30hZXP0pbL
	XljAfhcqtWl5o1DewjjY0wpVFwj3MYwyA1EwHm8qZge/118bMAqDA9wRRS9FGN0zzA8Pzepjw1rWf
	mQKOSTsZQX+obORTZ0766c72pzbCYYp6ivJw3dN1EzsDihkSGBE+bsh7vCCFTCUPGuopSWW1Au+pm
	/SOvFnRRyPEY9iA6NWt3WwrRpY5LIqKvO/UW4aS7g7EP/jndFboRgx6Vy7TiAjEmxHhZE8sa2yQuy
	6CIUU5q4J467qhAJtrtTzBf4I98EFGq4/7N5vguAyZ2GQCgX9pNqDL7MMCDuT3v9BLVECqhuEvpLp
	o3y2fldQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMegE-0000000AplK-0zDs;
	Fri, 30 Oct 2026 04:57:30 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMegB-0000000Apkb-35Q6
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Oct 2026 04:57:29 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a215e64962so2186165e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Oct 2026 21:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793336245; x=1793941045; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=70j/JPno7B9xtvcJSe+D2llozuMkyOhwkjeWL10j++0=;
        b=nnTjRJJFSL8eWZT0EFcKyAb5y4VllI/XFntUsUmjP40FYZbKCAkIqICXdtYi6l2ZbE
         AgEKPCmx46GiBKCEb45tmkfVKwn2SiaKynmJ8p2iia9n0eQUjyRjcyv+5J7P4w4K3VxJ
         fTxse16tUQXXDuUsoV5blGfDgvE8SLwLDJS0hetrE/n7SJx62qoV/0l4FnM2jL4FQt8/
         zXT5W+e6KsCg/i53niLp1z7AVVO+H5XLsZJ6vB0IfNh58VTIUK8wuTxZeReD/vAvKEEp
         +MF0CjYoOvj4pudGzR5eQyrZKIdz161OljoP/fXVVMwaTubtVVLUoBDUZOd6SMBWOngU
         Oh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793336245; x=1793941045;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=70j/JPno7B9xtvcJSe+D2llozuMkyOhwkjeWL10j++0=;
        b=KfZ27PTm2w3Hm+Us+6GlhvqvXLrCnw0DBb0oT20EzW6GDqUK5d5vllcCYD/iknA6Ho
         vyQaKsu5xmxfXadklw0UXu6qZCYjHCHcWa2YLrTDz28M1Ew3FERw3UvPI+k12i0nZ9+V
         OQfofjux9vPYIyC/rzSLpy6vW9TxE65v6GKRB4blmEhrPh2omCL8EjFmEOKkppf049cG
         K52wbT4Mc1I5e93ln/Wtmig1zQfC7S/prGg2cF44Yykn1g4s2bfTYCpilU1/jC0bV7bV
         haOIn4Td4ePjF94XdjURNKvBUxUYXmGS4FUh8A5tpHXBSl/qLIlAcUj+LNEXidrhJ1mn
         YCqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQzCcre3QvbEbeJg9M9d8im1GlW00/I1gzDTQ/sHTZZoNx31jVZ3K3GYuMysbEU5EeNeY86K+8qitxSqV05Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYL/4J9zJAPZFPAChnEpKaiUmmQh/y6T+le4pylG5nOgH/PBmQET
	3L1RSVwbxd/teQkRVfW+NJXEv710gLJld4k9BXCpLpdxlzBIL5FRYAlX
X-Gm-Gg: AYBFou3rzRWlT8qAQq2vFSlMx8vXExehcRSXD93xdSmiI+1RbD2lXxsUQLo2PBlkiBO
	u90aitIAUHXC/PgD1MFx6a9qKFroG80XPuB+E8TzUtHCG1hlvbOhuHd0lTMruaapRhGPWY/MYng
	fpzpKmUhJWEk7FSpHuXo1xDkPzM5qsJjHj5HMdmH9BhuHirYrbkmAn6oJF1cC3vRsPW17lCDHXp
	hvrQH9mmmxQSh/c+jW+1n8iX2w9e6te5XJJEw+VsC1QfCZqaBZca5BuaKlpaXAZ3iRS9mwEp4uR
	xhyPCl2e3XUPQL1R0XpfZmhjd40UQRxzdU/StsiPiSXCamSVsCIP5Wg/KvL95jPpYKvlHAW1TVl
	yplLUxYfIPr94FhmoVlswjuTK5dURZ/1Sbgi0r2JouoCsng27M6gVFuGuEwxUAA4n34DVnpSJqg
	YnFjA+M8Ukj9IBI8ldysa4mlimlHPin+JDY/fBpybKqgouYODTblgUTPBFTF5+IbkK2vEmvpxWl
	eMC7LTFqgEpvS/shmWVGDV9v/6qogG+Wotytia8CGCG735r62M2eUoCi1oCEXkFHE0mf/oUUC42
	ip0uf8+CKHFK7kO0qYLoyvsTggaP2wgtWLUAZGTjc3QjG0iMwylRhaR/pSaERpRsXOgwxNA6bMo
	A0+W5O3YQxzIwV7P3mBhyTnVmQDW8eAN4b2Hq0mC8JWO/zDuc+fI0CGF2W24qRjoLuNgh
X-Received: by 2002:a05:600c:8183:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4ac180f2ba7mr19414065e9.12.1793336244922;
        Thu, 29 Oct 2026 21:57:24 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789c6sm1116780f8f.26.2026.10.29.21.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:57:24 -0700 (PDT)
Date: Fri, 30 Oct 2026 07:57:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: anthony.liu@mediatek.com
Cc: nbd@nbd.name, lorenzo@kernel.org, Leon.Yen@mediatek.com,
	Quan.Zhou@mediatek.com, Ryder.lee@mediatek.com,
	Sean.Wang@mediatek.com, emery.hsin@mediatek.com,
	jb.tsai@mediatek.com, kun.wu@mediatek.com,
	linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
	litien.chang@mediatek.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mt76: fix buffer overrun in pkt buffer
Message-ID: <auQjsDPP1PeJg5sV@stanley.mountain>
References: <20261020032201.568970-1-anthony.liu@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020032201.568970-1-anthony.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_215727_797504_B2C43625 
X-CRM114-Status: GOOD (  13.80  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 11:22:00AM +0800, anthony.liu@mediatek.com wrote:
> From: Anthony Liu <anthony.liu@mediatek.com>
> 
> The last patch (d4e5ca3483a0) addresses mt7928 F/W 4 byte-aligment
> requirement by reducing pkt buffer by 2 bytes, causing the chance
> of buffer overrun.
> 
> This patch reduces incoming skb length limit accordingly.
> 
> Fixes: d4e5ca3483a0 ("wifi: mt76: mt7928: makes struct beacon_tlv 4-byte aligned.")
> Signed-off-by: Anthony Liu <anthony.liu@mediatek.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202610172141.mmRmGqow-lkp@intel.com/
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> index 26cdb3f0a98a..131585b3359d 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> @@ -2479,7 +2479,7 @@ mt7925_mcu_uni_add_beacon_offload(struct mt792x_dev *dev,
>  		return -EINVAL;
>  	}
>  
> -	if (skb->len > 512) {
> +	if (skb->len > 510) {

I would probably use:

	if (skb->len > sizeof(req.beacon_tlv.pkt)) {

but, we do need to apply this patch in linux-next.

regards,
dan carpenter


