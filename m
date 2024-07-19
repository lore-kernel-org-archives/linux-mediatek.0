Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BB5C3DA5D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jul 2024 22:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKhqmKb4pLxr6ks4VHAGgseoWstMLoaNLLgWmMC/tQg=; b=vMse+BWQBJpIE1cdDBXFHFnW/6
	UOuWWm2Rb4LXZV85QpECTgHFF+h3//4QUwJaXXFFD3hEN34y8mK8HR0np6vBcTRYo7IMMWVmQY6+p
	pGq3ZXdwWTOhXRLC2OIUkRXbSmll6aqxjKqbud0kjNyZ44voAXSMUWkbDeGhBbHod3kDDkqibeEQE
	jJy1VNVfWN8m4M4AnMXWnidGnvjUFWiSZx8jKOEom6bMsQS8hNlZAiWvVsxSzW4TtuDunkjd7cypu
	334BWNveLkcQza3fQh38DZXGuFeS7qnPGjuOXWvwhmRO6BcUEmCCGOqBbbMf/fy+0EtkBN3f1fvah
	Au3xeyWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUvv1-00000003tiK-36XH;
	Fri, 19 Jul 2024 22:17:39 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUvuz-00000003thm-0ZWo
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jul 2024 22:17:38 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-5ce74defe43so1308552eaf.2
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Jul 2024 15:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721427456; x=1722032256; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iKhqmKb4pLxr6ks4VHAGgseoWstMLoaNLLgWmMC/tQg=;
        b=I1o2GjMZzMtbdyhuEI1xP1XZ4cqHllqtLPCh0Gzq9BehyUIdPleIMxg11aeOJmE3+L
         p0JzZYq+EehWIlenV3IFBe83gijNYzOfOMWjZADiZxtNCI/LwP6l4KPlXz2/8gkcmA1e
         rsbNmSPV00rs002Q9RD+Y7HlaJNgRypK2/bNETvgcVmPIGl2977NvRMVjRaBeodvVMbI
         GemlLgAhSkB433QdfwNLJSSjBmAc0bWFtDgl7PdWy0ANeSnj+ZOQPNakj+fjmPYihKBu
         PZVkfqxZjNBVsyLx/rf4WRWLZpQFoSy5yB8VTM096ZoXSsHCf+/ZgDNcjwW0Se2maL6E
         CHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721427456; x=1722032256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKhqmKb4pLxr6ks4VHAGgseoWstMLoaNLLgWmMC/tQg=;
        b=tpj5EEBnqsIMS7eTHQxRzdU1cVWSDf8exVn5ovGF4Al5fwo+uFuBmMO2Yv9t1ddjbE
         L2DxI5+xHeETpyoZqfZ42YssV8jSRLTLW0MaGpRSBUqvJkH489aIfHpUskx6S6L+sRau
         t01sPav/DchxW1xuwQwkHjked2hj83QYS/wmdkI3lnc+5sUaOHzE97DaWTWc4LZsj7rR
         hPOzp7oEBruWurnkTGHCMWcHxTOQLAjFOJmHsT7g1qcRdbwRWdsnePB7G181+Zkx83Ic
         Mjwwcawhj+K7L4bjfZgac8gPRE678Fo/yPhf/0FFEyDzu/MCzIHPoTshjvq+U1ZnqYhs
         IDYA==
X-Gm-Message-State: AOJu0YzoW5q5995mPB8BkD2N6tICt+V+3FCcPE6O/aBcaG8jo7GH9Bru
	/MwH7Rj3k3fA3mOVT3aLQp0WJHVoMR4RMBPIH0iFPeef0dMNgzLI4d8ub0nm75g=
X-Google-Smtp-Source: AGHT+IGWwFUuXo/9q3+Dj1LP5RocAsc09F5iqW9biVqhnOAC8LgZZtzXcBq10YINMuQ78LRbZJWDgg==
X-Received: by 2002:a4a:e901:0:b0:5c4:e8d:58be with SMTP id 006d021491bc7-5d564f6409bmr1744353eaf.3.1721427455730;
        Fri, 19 Jul 2024 15:17:35 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:4528:a9e:1eaf:80c5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5d55a830900sm401546eaf.11.2024.07.19.15.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 15:17:35 -0700 (PDT)
Date: Fri, 19 Jul 2024 17:17:33 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-mediatek@lists.infradead.org
Subject: Re: [bug report] net: airoha: Introduce ethernet support for EN7581
 SoC
Message-ID: <2a1c1a25-8b89-43d0-b1df-6ffab7c2f3eb@suswa.mountain>
References: <395b364b-8a37-40ce-ac24-4f0bd7eb0e2a@stanley.mountain>
 <ZprPHlFgp1G2iTkM@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZprPHlFgp1G2iTkM@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_151737_222691_FDB13C0F 
X-CRM114-Status: GOOD (  13.21  )
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

On Fri, Jul 19, 2024 at 10:39:58PM +0200, Lorenzo Bianconi wrote:
> [...]
> > drivers/net/ethernet/mediatek/airoha_eth.c
> >     1134 static void airoha_fe_pse_ports_init(struct airoha_eth *eth)
> >     1135 {
> >     1136         const u32 pse_port_num_queues[] = {
> >     1137                 [FE_PSE_PORT_CDM1] = 6,
> >     1138                 [FE_PSE_PORT_GDM1] = 6,
> >     1139                 [FE_PSE_PORT_GDM2] = 32,
> >     1140                 [FE_PSE_PORT_GDM3] = 6,
> >     1141                 [FE_PSE_PORT_PPE1] = 4,
> >     1142                 [FE_PSE_PORT_CDM2] = 6,
> >     1143                 [FE_PSE_PORT_CDM3] = 8,
> >                          ^^^^^^^^^^^^^^^^^^^^^^^
> > 
> >     1144                 [FE_PSE_PORT_CDM4] = 10,
> >     1145                 [FE_PSE_PORT_PPE2] = 4,
> >     1146                 [FE_PSE_PORT_GDM4] = 2,
> >     1147                 [FE_PSE_PORT_CDM5] = 2,
> >     1148         };
> >     1149         int q;
> >     1150 
> >     1151         /* hw misses PPE2 oq rsv */
> >     1152         airoha_fe_set(eth, REG_FE_PSE_BUF_SET,
> >     1153                       PSE_RSV_PAGES * pse_port_num_queues[FE_PSE_PORT_PPE2]);
> >     1154 
> >     1155         /* CMD1 */
> >     1156         for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_CDM1]; q++)
> >     1157                 airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_CDM1, q,
> >     1158                                          PSE_QUEUE_RSV_PAGES);
> >     1159         /* GMD1 */
> >     1160         for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_GDM1]; q++)
> >     1161                 airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_GDM1, q,
> >     1162                                          PSE_QUEUE_RSV_PAGES);
> >     1163         /* GMD2 */
> >     1164         for (q = 6; q < pse_port_num_queues[FE_PSE_PORT_GDM2]; q++)
> >     1165                 airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_GDM2, q, 0);
> >     1166         /* GMD3 */
> >     1167         for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_GDM3]; q++)
> >     1168                 airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_GDM3, q,
> >     1169                                          PSE_QUEUE_RSV_PAGES);
> >     1170         /* PPE1 */
> >     1171         for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_PPE1]; q++) {
> >     1172                 if (q < pse_port_num_queues[FE_PSE_PORT_PPE1])
> >     1173                         airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_PPE1, q,
> >     1174                                                  PSE_QUEUE_RSV_PAGES);
> >     1175                 else
> >     1176                         airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_PPE1, q, 0);
> >     1177         }
> >     1178         /* CDM2 */
> >     1179         for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_CDM2]; q++)
> >     1180                 airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_CDM2, q,
> >     1181                                          PSE_QUEUE_RSV_PAGES);
> >     1182         /* CDM3 */
> > --> 1183         for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_CDM3] - 1; q++)
> >                                                                       ^^^^
> > This - 1 doesn't look intentional.  It's the only time this value is used.
> 
> I checked the vendor sdk and this is fine.
> 

If there are 7 queues, just change [FE_PSE_PORT_CDM3] = 7.  If there are
8 queues but the last one is not used, then add a comment.  /* The - 1 is
because we are reserving the last queue for secret reasons. Shhhh... */
That way people will know it's intentional.

regards,
dan carpenter


