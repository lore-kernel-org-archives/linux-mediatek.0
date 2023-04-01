Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD7FC76196
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 01:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mC5lgCpWiVErRdOUsS4kk+MDBnluSPTGN4PngsFM3Zo=; b=Ac3g8CEuazMVBhBa0XdAdD89qC
	NTXX1Xd4UN/IFbo1j5I9n9+qOKqfcHrPNHbt7sFHwCb9JLBQtu4z2azebS4BDzrsK34RCh/cgXF38
	UTEJqS2ZqGf3IbeYNouPfSniA0wbMldBuxYyd1q/4Mp6HcjmsOF4L+hKbMDsh1Etn5EWvM+/yyesh
	maK41MvmEzX6iJgUAcSH6p9RUrBo45QMVo1UT0ODbsoeS9lixxTZ25D/wyaenMeCvFC9Ql7vTM8Xf
	f3um7H0UcW6wbgvcevnDiyDUB81Ys3baTJhl+ZfPGV5jsuKTR9ZoO0H02WtCjFtA4KWmSdoKnih6p
	CEAc5cbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piPcE-009P4R-1F;
	Sat, 01 Apr 2023 01:01:10 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piPcA-009P35-0K;
	Sat, 01 Apr 2023 01:01:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 97307B8322C;
	Sat,  1 Apr 2023 01:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70020C433EF;
	Sat,  1 Apr 2023 01:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680310863;
	bh=tt7ZGatFV1hjdhv+xFUnZBFTFezV1KSetDds2ucKZNs=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=janccKIkv8gk5FEqwL/V+sypzlpq4VKfugp40dB6anoP5nnRNthYLPOkEfwEJ7cdJ
	 j7MogpyMRpzNioQVQhOZpLQSKoBI1jVCSBDSwEia/Ga+jgrS1tewbGxgUNjygTltw0
	 vZ8ixmvySVtuX7D4ZpF76C3li+cBtzLsH1+1UwFs+nXq+XRYmRNBnPa9OovYqYo4+/
	 fFECcg/GgLz0FVsEwhTi1U936XArQt5FUSoSNJrCtUqHmwMROp8LLBf2rt7BH8OCoT
	 jrpo3I3356eoXIB0tiZFTO5HeQp4NmQXBwsdra2KKn9gbSkF9iM3upx92YFOa5V1ih
	 Vo3P/JEDThlrw==
Message-ID: <ec3f83d3-c00c-17d5-c967-2e3e7a4798c7@kernel.org>
Date: Sat, 1 Apr 2023 09:00:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Bo Ye <bo.ye@mediatek.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 xiongping1 <xiongping1@xiaomi.com>, qixiaoyu1 <qixiaoyu1@xiaomi.com>
Cc: yongdong.zhang@mediatek.com, peng.zhou@mediatek.com,
 browse.zhang@mediatek.com, light.hsieh@mediatek.com,
 Qilin Tan <qilin.tan@mediatek.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230331092658.72386-1-bo.ye@mediatek.com>
 <20230331092658.72386-2-bo.ye@mediatek.com>
From: Chao Yu <chao@kernel.org>
Subject: Re: [PATCH 2/2] f2fs: add __pack attribute for extent_info
In-Reply-To: <20230331092658.72386-2-bo.ye@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_180106_423624_48F53156 
X-CRM114-Status: GOOD (  22.59  )
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

On 2023/3/31 17:26, Bo Ye wrote:
> From: Qilin Tan <qilin.tan@mediatek.com>
> 
> Need add __pack for struct extent_info to align to memory
> layout of struct rb_entry.

Jaegeuk has fixed this bug w/ below patchset, please check it:

https://lore.kernel.org/linux-f2fs-devel/20230313201216.924234-1-jaegeuk@kernel.org/

Thanks,

> 
> struct rb_entry {
>      struct rb_node rb_node;     /* rb node located in rb-tree */
>      union {
>          struct {
>              unsigned int ofs;   /* start offset of the entry */
>              unsigned int len;   /* length of the entry */
>          };
>          unsigned long long key;     /* 64-bits key */
>      } __packed;
> };
> 
> struct extent_info {
>      unsigned int fofs;      /* start offset in a file */
>      unsigned int len;       /* length of the extent */
>      union {
>          ...
>          /* block age extent_cache */
>          struct {
>              /* block age of the extent */
>              unsigned long long age;
>              /* last total blocks allocated */
>              unsigned long long last_blocks;
>          };
> };
> 
> The new fields(age, last_blocks) are u64 in change 71644dff4811, it
> cause the memory alignment based on 8 bytes in some complier. So the
> field fofs and len are alloced with 8 bytes and using the last 4 byts.
> Its memory is not aligned with struct rb_entry. the ofs of rb_entry
> pointer to a invalid value and cause writing file failed.
> 
> struct extent_info's offset should be 12 rather than 16 from the
> beginning of struct rb_entry.
> 
> The offset dump for the bad case as:
> kworker/u16:6: [name:f2fs&]f2fs_lookup_rb_tree_for_insert:MTK_DEBUG: ino=1629 re=0xc675dc08 ofs=0 re->ofs=0, re->len=68 ei=0xc675dc18 ei.fofs=68 ei.len=277
> 
> Fixes: 71644dff4811 ("f2fs: add block_age-based extent cache")
> Signed-off-by: Bo Ye <bo.ye@mediatek.com>
> Signed-off-by: Qilin Tan <qilin.tan@mediatek.com>
> ---
>   fs/f2fs/f2fs.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index b0ab2062038a..7c690667a42f 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -660,7 +660,7 @@ struct extent_info {
>   			unsigned long long last_blocks;
>   		};
>   	};
> -};
> +} __packed;
>   
>   struct extent_node {
>   	struct rb_node rb_node;		/* rb node located in rb-tree */

