Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BD1C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 20:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZz5lIxuDB7I0z1jD8r02lw8MXfBIpXPRDPu83kXprE=; b=JQcnmVgDuUTm8GeLuFADGTDTWp
	0fA0qpcbRFW0LoeMhhpVqRox859/47vgpk4dpImKk55CS+zaPgD2rNu4jC2gkd6fJifgSd1llQS+R
	OZ9bMNRyxh/srR3tWUtD48BEkYqe7/O5Ga9opdOv5NjfmoxH1z/UvBtlYNXQ+5871LglLskGTmGte
	l/gq+XeV6yzCTd2ZdNVk83r1DheFDcBGy6ZYRUtWO7R5WZZhdiwlTcjD/K/SF/t4f0s8aQNby76UR
	9BUACHO4OcV4zzzLj5RtCPPWHU68LK7S4cDK7J/Ct70gUshbRrdcfot1mWM23r2Q/eSAQFQKjIn3+
	nrcOkQzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os9AD-000RfX-51; Mon, 07 Nov 2022 20:56:13 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os9A2-000RXX-6x; Mon, 07 Nov 2022 20:56:03 +0000
Received: by mail-ed1-x534.google.com with SMTP id u24so19482994edd.13;
        Mon, 07 Nov 2022 12:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aZz5lIxuDB7I0z1jD8r02lw8MXfBIpXPRDPu83kXprE=;
        b=lcXa8yD0SgTUPQeGlv227tDRMrB5NnfEInO0NrD4HykU0N5ueMLTDPxXEpe4pJTJY5
         +wK/aRIZRTyxwXuzqNVBd8eKLBMBlIyI/JgcV3eN5CfMcZaVcgbh1cmGfJ4qY6CMN1pS
         y/WPX1gnhv8dezjEePLyT+6MI5cREwiKs0FzVshIW0A2tUUuBECTwEfygyBjw0EIzIL7
         bfOsiCsZuwm/C0dTUElfowYYH8InVD+HVNS3XC3piOewEAbrSbFNpOExugQl+Ah8DPmh
         pGple9hGCOZkPNH3sAjqfQjV9Zgi8FmSPGJWBpDRSz8UD13WzNVlwGZoXX9OoGjyNQ0W
         ldww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZz5lIxuDB7I0z1jD8r02lw8MXfBIpXPRDPu83kXprE=;
        b=WJlL/6ivlAdqhgvWho8H+Y7iPLLnJVVWZR70ayOIfr2EUQT13oY5o+KnsEhAoLT7Ll
         HHjaNj11BW4bY1B4/sHVBZdtJOSnW4hOK61rs8EhCJ4fTcPYli/SfyOsyq3vfQ8xabsL
         mccnsOys5wL70gAxHNilhK1AdzBG8FnCZ4lHAxRSfPhf6/lwql/F8dLXL3iq/aMPqp9I
         uN1ndZOu3J3hiVGXvkTDEzeLYxCKQCp4QFH8A/dqGHmnGFXHNFlBdFGwTqrIDN77n+PJ
         a2i8JPQGjIeTZirw4bXDQ8Ctphw6b2GJKusKFGQE01amB0pFwhFBUIyCzoQMa6Jt6pfe
         UNuA==
X-Gm-Message-State: ACrzQf2HNOztwlLSxmBP4k/vazCZ36Q2giUTY2xOPrwQpJA//fdLX/bA
	4KpLJUqc9Fl6cfOmV/jVvtw=
X-Google-Smtp-Source: AMsMyM6ioc0P0uojdmQ1u0VY0uZvTZqZ5dbDJ15EFDJgrrKmfO6nqvWye/xti1qfyvHjVNe1PfWaDA==
X-Received: by 2002:a50:ef06:0:b0:463:2605:d24d with SMTP id m6-20020a50ef06000000b004632605d24dmr47036181eds.43.1667854560277;
        Mon, 07 Nov 2022 12:56:00 -0800 (PST)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id g18-20020a17090604d200b0073dc5bb7c32sm3882261eja.64.2022.11.07.12.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 12:55:59 -0800 (PST)
Date: Mon, 7 Nov 2022 22:55:53 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/14] net: ethernet: mtk_eth_soc: account for vlan in rx
 header length
Message-ID: <20221107205553.cnydzeh3tmilqblx@skbuf>
References: <20221107185452.90711-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107185452.90711-1-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_125602_300808_DCA190C7 
X-CRM114-Status: GOOD (  16.43  )
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

On Mon, Nov 07, 2022 at 07:54:39PM +0100, Felix Fietkau wrote:
> This may be needed for correct MTU settings on devices using DSA
> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> index 589f27ddc401..dcf2a0d5da33 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> @@ -29,7 +29,7 @@
>  #define MTK_TX_DMA_BUF_LEN_V2	0xffff
>  #define MTK_DMA_SIZE		512
>  #define MTK_MAC_COUNT		2
> -#define MTK_RX_ETH_HLEN		(ETH_HLEN + ETH_FCS_LEN)
> +#define MTK_RX_ETH_HLEN		(VLAN_ETH_HLEN + ETH_HLEN + ETH_FCS_LEN)

Commit title says account for VLAN (VLAN_HLEN, 4 bytes), code says add
VLAN_ETH_HLEN (18) more bytes.

Also, why is DSA mentioned in the commit message? Is accounting for VLAN
hlen not needed if DSA is not used? Why?

>  #define MTK_RX_HLEN		(NET_SKB_PAD + MTK_RX_ETH_HLEN + NET_IP_ALIGN)
>  #define MTK_DMA_DUMMY_DESC	0xffffffff
>  #define MTK_DEFAULT_MSG_ENABLE	(NETIF_MSG_DRV | \
> -- 
> 2.38.1
> 

