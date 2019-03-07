From: Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] soc: mediatek: pwrap: Zero initialize rdata in
 pwrap_init_cipher
Date: Thu,  7 Mar 2019 15:56:51 -0700
Message-ID: <20190307225650.23001-1-natechancellor@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, linux-mediatek@lists.infradead.org, Nathan Chancellor <natechancellor@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

When building with -Wsometimes-uninitialized, Clang warns:

drivers/soc/mediatek/mtk-pmic-wrap.c:1358:6: error: variable 'rdata' is
used uninitialized whenever '||' condition is true
[-Werror,-Wsometimes-uninitialized]

If pwrap_write returns non-zero, pwrap_read will not be called to
initialize rdata, meaning that we will use some random uninitialized
stack value in our print statement. Zero initialize rdata in case this
happens.

Link: https://github.com/ClangBuiltLinux/linux/issues/401
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

I don't know if this is better or to just restructure the if statement
below (I'm not an expert in this code so I'll leave that up to the
maintainers to decide).

 drivers/soc/mediatek/mtk-pmic-wrap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 8236a6c87e19..2f632e8790f7 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -1281,7 +1281,7 @@ static bool pwrap_is_pmic_cipher_ready(struct pmic_wrapper *wrp)
 static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 {
 	int ret;
-	u32 rdata;
+	u32 rdata = 0;
 
 	pwrap_writel(wrp, 0x1, PWRAP_CIPHER_SWRST);
 	pwrap_writel(wrp, 0x0, PWRAP_CIPHER_SWRST);
-- 
2.21.0
