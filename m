Return-Path: <SRS0=hSNv=LK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D9EBC48BE6
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 15:02:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 169C460233
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 15:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 169C460233
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N978jwly3w5UulKLGgfLwb0sWRoPDTLyzKzUcXSSiXk=; b=NcdcPRYzhGqyyG
	IDnmGOCMjmPB6fcVAuOjA6YhJnWRcxKO1Bvuj1l3xia2Omh8o7AhMbvwLFTL+D8aCwhup8n7mQKw5
	kpUHLzB9m22dwK6WBm6lWR8IxwGTEkHCoig4y3wH3fecCe/X/b/av/RZ6ce/j1B6PXd9598D5JWTj
	pTGbcbEVjqWqy8KuO8eryjM61qUW0fCEeFTlBAHLNmg4kl/A3unlmKDbfChUE3NL+Busw9oS6I33I
	ka5wkIfE0pK0IDwhsNWMgI259kBsR+LkbxGkT9WaQZ8lJhHrwV8G+TDlPBao/IqOS3UAM9q53FZSR
	3qirZQnYiOmOVf8d4kYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltX39-006nfe-Ln; Wed, 16 Jun 2021 15:01:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltX2x-006nd4-Dz; Wed, 16 Jun 2021 15:01:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=I5DjI7oj7+RHnDV6cxwDeOoQ3n60YwGRMyOOSPM02Qk=; b=FdKzXZ9x5ATmodn0JioFshI/ht
 bdpS5+BCXFSEs+EM4u+wfgZ0T6OKJCP/WkbnVQi3YNxOcuedepjMeyiMX9264TX3MQJaKszqGFgbo
 4uvKVdhXRRK8u5GgHORw45pFBRkzSAzZBfyjVsW/4AOY93ztSstnsy5dU8B00kSIry2/1CcUNlp7n
 FhUhDHRYOhfr4cA/CaaLW3XuaaC1lPhNNsasz/NDn8eMulp0Njdvf2m4DR5k8Q9zVeBHqJXk9R9Na
 NR+8ZKhGQZsDOMEDmNefJ6KCJVtznwT7/l8liFHleWZrSoSFeJBPFbAC2uf/qO/hXLkZ5t0bbJLyr
 yKnVWqnw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltX2W-008AIS-NX; Wed, 16 Jun 2021 15:01:19 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DC5F8300269;
 Wed, 16 Jun 2021 17:01:10 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id C11E42C516D3B; Wed, 16 Jun 2021 17:01:10 +0200 (CEST)
Date: Wed, 16 Jun 2021 17:01:10 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: rostedt@goodmis.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, mhelsley@vmware.com,
 samitolvanen@google.com, yj.chiang@mediatek.com
Subject: Re: [PATCH v3] recordmcount: Correct st_shndx handling
Message-ID: <YMoSNnNXmKnDpJEv@hirez.programming.kicks-ass.net>
References: <20210615162313.26081-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210615162313.26081-1-mark-pk.tsai@mediatek.com>
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

On Wed, Jun 16, 2021 at 12:23:13AM +0800, Mark-PK Tsai wrote:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> One should only use st_shndx when >SHN_UNDEF and <SHN_LORESERVE. When
> SHN_XINDEX, then use .symtab_shndx. Otherwise use 0.
> 
> This handles the case: st_shndx >= SHN_LORESERVE && st_shndx != SHN_XINDEX.
> 
> Reported-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Tested-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> [handle endianness of sym->st_shndx]
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
>  scripts/recordmcount.h | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
> index f9b19524da11..ef9c3425f86b 100644
> --- a/scripts/recordmcount.h
> +++ b/scripts/recordmcount.h
> @@ -194,13 +194,18 @@ static unsigned int get_symindex(Elf_Sym const *sym, Elf32_Word const *symtab,
>  	unsigned long offset;
>  	int index;
>  
> +	if (w2(sym->st_shndx) > SHN_UNDEF &&
> +	    w2(sym->st_shndx) < SHN_LORESERVE)
>  		return w2(sym->st_shndx);
>  
> +	if (w2(sym->st_shndx) == SHN_XINDEX) {
> +		offset = (unsigned long)sym - (unsigned long)symtab;
> +		index = offset / sizeof(*sym);
>  
> +		return w(symtab_shndx[index]);
> +	}
> +
> +	return 0;
>  }

Thanks. However that leads to atrocious codegen because w2 is an
indirect function, something like the below seems much better.

1d00:       41 0f b7 7f 0e          movzwl 0xe(%r15),%edi
1d05:       c0 eb 04                shr    $0x4,%bl
1d08:       ff 15 7a 54 00 00       callq  *0x547a(%rip)        # 7188 <w2>
1d0e:       85 c0                   test   %eax,%eax
1d10:       74 16                   je     1d28 <main+0xba8>
1d12:       41 0f b7 7f 0e          movzwl 0xe(%r15),%edi
1d17:       ff 15 6b 54 00 00       callq  *0x546b(%rip)        # 7188 <w2>
1d1d:       3d ff fe 00 00          cmp    $0xfeff,%eax
1d22:       0f 86 00 03 00 00       jbe    2028 <main+0xea8>
1d28:       41 0f b7 7f 0e          movzwl 0xe(%r15),%edi
1d2d:       ff 15 55 54 00 00       callq  *0x5455(%rip)        # 7188 <w2>

vs

1d0c:       41 0f b7 7f 0e          movzwl 0xe(%r15),%edi
1d11:       ff 15 71 54 00 00       callq  *0x5471(%rip)        # 7188 <w2>

---
diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
index f9b19524da11..b3e9d0563c03 100644
--- a/scripts/recordmcount.h
+++ b/scripts/recordmcount.h
@@ -192,15 +192,23 @@ static unsigned int get_symindex(Elf_Sym const *sym, Elf32_Word const *symtab,
 				 Elf32_Word const *symtab_shndx)
 {
 	unsigned long offset;
+	unsigned short shndx;
 	int index;
 
-	if (sym->st_shndx != SHN_XINDEX)
-		return w2(sym->st_shndx);
+	shndx = w2(sym->st_shndx);
 
-	offset = (unsigned long)sym - (unsigned long)symtab;
-	index = offset / sizeof(*sym);
+	if (shndx > SHN_UNDEF &&
+	    shndx < SHN_LORESERVE)
+		return shndx;
 
-	return w(symtab_shndx[index]);
+	if (shndx == SHN_XINDEX) {
+		offset = (unsigned long)sym - (unsigned long)symtab;
+		index = offset / sizeof(*sym);
+
+		return w(symtab_shndx[index]);
+	}
+
+	return 0;
 }
 
 static unsigned int get_shnum(Elf_Ehdr const *ehdr, Elf_Shdr const *shdr0)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
