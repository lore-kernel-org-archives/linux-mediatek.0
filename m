Return-Path: <SRS0=I1M+=LI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E11C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jun 2021 17:18:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D4FF61241
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jun 2021 17:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D4FF61241
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wanyeetech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XZxtlUY2cFxqKDVUrxdGbO0s5xyps825xBnc3H+jz30=; b=1XBlC2FUNh82Zt
	Ua2qL5zf1xulwA53K/awVAgL3ooDFIdX27bPQ36Mldsom2mbD9USx9+NbY7Z+ixeLMN4ydeK/lUfJ
	9j8pgaUxA/DvvuIBZF1KCX0ObGK+T4CjDfaMpDpe18x0zdbgoRddUcac4Qf4FXSUDBiwD1i6f26go
	8YCqlekLSPp29It+LO+CLb3kH+Z62R0RU/WydnVu6kzCtAD2B7xheksIUpYNQQOF2oeUFrEMxHVmN
	rNJdyW0kQkFMl/vxArK+RDuPYcQ+H3elki+LdIznCp5Oa68CqyhNz+FYbfV21ahqN61h0JpjB1kI+
	YlcPUAbXd5TckRq3gyKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsqE6-00FNtT-UT; Mon, 14 Jun 2021 17:18:18 +0000
Received: from out28-76.mail.aliyun.com ([115.124.28.76])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsqDq-00FNmt-4Y; Mon, 14 Jun 2021 17:18:03 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.3305371|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00425795-0.000892991-0.994849;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047208; MF=zhouyanjie@wanyeetech.com;
 NM=1; PH=DS; RN=21; RT=21; SR=0; TI=SMTPD_---.KSAJpVJ_1623691068; 
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com
 fp:SMTPD_---.KSAJpVJ_1623691068)
 by smtp.aliyun-inc.com(10.147.41.121);
 Tue, 15 Jun 2021 01:17:57 +0800
From: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?=
 <zhouyanjie@wanyeetech.com>
To: davem@davemloft.net, kuba@kernel.org, robh+dt@kernel.org,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
 sihui.liu@ingenic.com, jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH v3 0/2] Add Ingenic SoCs MAC support.
Date: Tue, 15 Jun 2021 01:15:35 +0800
Message-Id: <1623690937-52389-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_101802_395851_4B77017D 
X-CRM114-Status: UNSURE (   7.92  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

djItPnYzOgoxLkFkZCAiaW5nZW5pYyxtYWMueWFtbCIgZm9yIEluZ2VuaWMgU29Dcy4KMi5DaGFu
Z2UgdHggY2xrIGRlbGF5IGFuZCByeCBjbGsgZGVsYXkgZnJvbSBoYXJkd2FyZSB2YWx1ZSB0byBw
cy4KMy5yZXR1cm4gLUVJTlZBTCB3aGVuIGEgdW5zdXBwb3J0ZWQgdmFsdWUgaXMgZW5jb3VudGVy
ZWQgd2hlbgogIHBhcnNpbmcgdGhlIGJpbmRpbmcuCjQuU2ltcGxpZnkgdGhlIGNvZGUgb2YgdGhl
IFJHTUlJIHBhcnQgb2YgWDIwMDAgU29DIGFjY29yZGluZyB0bwogIEFuZHJldyBMdW5u4oCZcyBz
dWdnZXN0aW9uLgo1LkZvbGxvdyB0aGUgZXhhbXBsZSBvZiAiZHdtYWMtbWVkaWF0ZWsuYyIgdG8g
aW1wcm92ZSB0aGUgY29kZQogIHRoYXQgaGFuZGxlcyBkZWxheXMgYWNjb3JkaW5nIHRvIEFuZHJl
dyBMdW5u4oCZcyBzdWdnZXN0aW9uLgoK5ZGo55Cw5p2wIChaaG91IFlhbmppZSkgKDIpOgogIGR0
LWJpbmRpbmdzOiBkd21hYzogQWRkIGJpbmRpbmdzIGZvciBuZXcgSW5nZW5pYyBTb0NzLgogIG5l
dDogc3RtbWFjOiBBZGQgSW5nZW5pYyBTb0NzIE1BQyBzdXBwb3J0LgoKIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL25ldC9pbmdlbmljLG1hYy55YW1sICAgICAgIHwgIDc2ICsrKysKIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwgICAgICAgIHwgIDE1ICsKIGRyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL0tjb25maWcgICAgICAgIHwgIDEyICsKIGRy
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL01ha2VmaWxlICAgICAgIHwgICAxICsK
IC4uLi9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtaW5nZW5pYy5jICAgIHwgNDAx
ICsrKysrKysrKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA1MDUgaW5zZXJ0aW9ucygr
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9u
ZXQvaW5nZW5pYyxtYWMueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWluZ2VuaWMuYwoKLS0gCjIuNy40CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
