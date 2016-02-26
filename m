From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V7 1/2] regulator: Add document for MT6323 regulator
Date: Fri, 26 Feb 2016 15:22:10 +0100
Message-ID: <3623271.aQ3n624Sax@wuerfel>
References: <1456145817-12741-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1456145817-12741-1-git-send-email-blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Monday 22 February 2016 13:56:56 John Crispin wrote:
> Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
> This patch needs to be merged post-rc1 as it depends on the MFD series of
> the PMIC which is already inside Lee's tree pending the PR.

(dropping most lists)

Hi John,

Do you or someone else have a git tree that has all the remaining
patches for mt6323 that need to be merged?

We are doing a code review session at Linaro Connect and it seems
like a nice platform to include, given that it is simpler than
most of the phone oriented platforms that have lots of complex
code out of tree.

	Arnd
